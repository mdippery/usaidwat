require 'usaidwat/algo'
require 'usaidwat/client'
require 'usaidwat/pager'
require 'sysexits'

module USaidWat
  module Application
    class Command
      include Pager
      include Sysexits

      attr_reader :client

      def initialize(prog)
        @client = cucumber? ? USaidWat::Client::TestRedditor : USaidWat::Client::Redditor
      end

      protected

      def cucumber?
        ENV['USAIDWAT_ENV'] == 'cucumber'
      end

      def quit(message, code=:ok)
        puts message
        exit code
      end
    end

    class Log < Command
      def initialize(prog)
        prog.command(:log) do |c|
          c.alias :l
          c.option 'grep', '--grep STRING', 'Show only comments matching STRING'
          c.option 'oneline', '--oneline', 'Output log in a more comptact form'
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
        subreddit = args.shift

        redditor = client.new(username)
        comments = redditor.comments
        if subreddit
          comments = comments.group_by { |c| c.subreddit.downcase }
          comments = comments[subreddit.downcase]
          quit "No comments by #{redditor.username} for #{subreddit}." if comments.nil?
        end
        comments = comments.select { |c| c.body =~ /#{options['grep']}/i } if options['grep']
        if comments.empty?
          msg = "#{redditor.username} has no comments"
          msg = "#{msg} matching /#{options['grep']}/" if options['grep']
          msg = "#{msg}."
          quit msg
        end
        list_comments(comments, options['grep'], !options['oneline'].nil?, !options['raw'].nil?)
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end

      private

      def list_comments(comments, pattern = nil, oneline = false, raw = false)
        formatter = (oneline ? USaidWat::CLI::CompactCommentFormatter : USaidWat::CLI::CommentFormatter).new(pattern, raw)
        page
        comments.each { |c| print formatter.format(c) }
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
        algo_cls = options['count'] ? USaidWat::Algorithms::CountAlgorithm : USaidWat::Algorithms::LexicographicalAlgorithm
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
        algo = algo_cls.new(buckets)
        subreddits = buckets.keys.sort { |a,b| algo.sort(a, b) }
        subreddits.each do |subreddit|
          tally = buckets[subreddit]
          printf "%-*s  %3d\n", longest_subreddit, subreddit, tally
        end
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end
    end
  end
end
