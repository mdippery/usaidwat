require 'usaidwat/algo'
require 'usaidwat/client'
require 'usaidwat/either'
require 'sysexits'
require 'usaidwat/filter'
require 'usaidwat/pager'
require 'usaidwat/ext/array'

require 'timecop' if ENV['USAIDWAT_ENV'] == 'cucumber'

module USaidWat
  module Application
    class Command
      include Pager
      include Sysexits

      attr_reader :client

      class << self
        def subclasses
          @subclasses ||= []
        end

        def inherited(base)
          subclasses << base
          super
        end
      end

      def initialize(prog)
        @client = cucumber? ? USaidWat::Client::TestRedditor : USaidWat::Client::Redditor
        Timecop.freeze(Time.parse(ENV['USAIDWAT_CURRENT_TIME'])) if cucumber_time?
      end

      protected

      def cucumber?
        ENV['USAIDWAT_ENV'] == 'cucumber'
      end

      def cucumber_time?
        cucumber? && !ENV['USAIDWAT_CURRENT_TIME'].nil?
      end

      def quit(message, code=:ok)
        stream = code == :ok ? $stdout : $stderr
        stream.puts message
        exit code
      end
    end

    class Info < Command
      def initialize(prog)
        prog.command(:info) do |c|
          c.action do |args, options|
            process(options, args)
          end
        end
        super
      end

      def process(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        username = args.shift

        redditor = client.new(username)
        created_at = redditor.created_at.strftime("%b %d, %Y %H:%M %p")
        puts "Created: #{created_at} (#{redditor.age})"
        printf "Link Karma: %d\n", redditor.link_karma
        printf "Comment Karma: %d\n", redditor.comment_karma
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end
    end

    class Log < Command
      include FilterCommand

      def initialize(prog)
        prog.command(:log) do |c|
          c.alias :l
          c.option 'date', '--date FORMAT', 'Show dates in "absolute" or "relative" format'
          c.option 'grep', '--grep STRING', 'Show only comments matching STRING'
          c.option 'limit', '-n LIMIT', 'Only show n comments'
          c.option 'oneline', '--oneline', 'Output log in a more compact form'
          c.option 'raw', '--raw', 'Print raw comment bodies'

          c.action do |args, options|
            process(options, args)
          end
        end
        super
      end

      def process(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        username = args.shift
        subreddits = args.subreddits

        redditor = client.new(username)
        comments = redditor.comments

        res = filter_entries('comments', redditor, comments, subreddits) >>
              lambda { |r| grep_entries('comments', redditor, r.value, options['grep']) } >>
              lambda { |r| limit_entries('comments', redditor, r.value, options['limit']) } >>
              lambda { |r| ensure_entries('comments', redditor, r.value) }

        quit res.value if res.left?

        opts = {
          :date_format => (options['date'] || :relative).to_sym,
          :oneline => !options['oneline'].nil?,
          :pattern => options['grep'],
          :raw => !options['raw'].nil?,
        }
        list_comments(res.value, opts)
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end

      private

      def list_comments(comments, options = {})
        oneline = options[:oneline]
        formatter = (oneline ? USaidWat::CLI::CompactCommentFormatter : USaidWat::CLI::CommentFormatter).new(options)
        page
        comments.each { |c| print formatter.format(c) }
      end
    end

    class Posts < Command
      include FilterCommand

      def initialize(prog)
        prog.command(:posts) do |c|
          c.action do |args, options|
            process(options, args)
          end

          c.command(:log) do |s|
            s.description "Show a user's submitted posts"
            s.action do |args, options|
              process_log(options, args)
            end
          end

          c.command(:tally) do |s|
            s.description "Tally a user's posts by subreddit"
            s.option 'count', '-c', '--count', 'Sort output by number of comments'
            s.action do |args, options|
              process_tally(options, args)
            end
          end
        end
        super
      end

      def process(options, args)
        quit "Do you want to tally or log posts?", :usage
      end

      def process_log(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        username = args.shift
        subreddits = args.subreddits

        redditor = client.new(username)
        posts = redditor.posts

        res = filter_entries('posts', redditor, posts, subreddits) >>
              lambda { |r| ensure_entries('posts', redditor, r.value) }

        quit res.value if res.left?
        posts = res.value

        formatter = USaidWat::CLI::PostFormatter.new
        page
        posts.each { |p| print formatter.format(p) }
      end

      def process_tally(options, args)
        puts "usaidwat submissions tally #{options} #{args}"
      end
    end

    class Tally < Command
      def initialize(prog)
        prog.command(:tally) do |c|
          c.alias :t
          c.option 'count', '-c', '--count', 'Sort output by number of comments'

          c.action do |args, options|
            process(options, args)
          end
        end
        super
      end

      def process(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        raise ArgumentError.new('You cannot specify a subreddit when tallying comments') if args.count > 1
        username = args.first

        redditor = client.new(username)
        quit "#{redditor.username} has no comments." if redditor.comments.empty?
        # Unfortunately Snooby cannot return comments for a specific
        # user in a specific subreddit, so for now we have to sort them
        # ourself.
        longest_subreddit = 0
        buckets = Hash.new { |hash, key| hash[key] = 0 }
        redditor.comments.each do |comment|
          subreddit = comment.subreddit
          longest_subreddit = subreddit.length if subreddit.length > longest_subreddit
          buckets[subreddit] += 1
        end
        algo = algorithm(options['count']).new(buckets)
        subreddits = buckets.keys.sort { |a,b| algo.sort(a, b) }
        subreddits.each do |subreddit|
          tally = buckets[subreddit]
          printf "%-*s  %3d\n", longest_subreddit, subreddit, tally
        end
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end

      private

      def algorithm(count)
        count ? USaidWat::Algorithms::CountAlgorithm : USaidWat::Algorithms::LexicographicalAlgorithm
      end
    end
  end
end
