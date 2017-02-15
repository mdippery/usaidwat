require 'usaidwat/client'
require 'usaidwat/command'
require 'usaidwat/count'
require 'usaidwat/filter'
require 'usaidwat/formatter'

module USaidWat
  module Application
    class Posts < Command
      include CountCommand
      include FilterCommand

      def initialize(prog)
        prog.command(:posts) do |c|
          c.action do |args, options|
            process(options, args)
          end

          c.command(:log) do |s|
            s.description "Show a user's submitted posts"
            s.option 'oneline', '--oneline', 'Output log in a more compact form'
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
        oneline = !!options['oneline']
        username = args.shift
        subreddits = args.subreddits

        redditor = client.new(username)
        posts = redditor.posts

        res = filter_entries('posts', redditor, posts, subreddits) >>
              lambda { |r| ensure_entries('posts', redditor, r.value) }

        quit res.value if res.left?
        posts = res.value

        formatter = (oneline ? USaidWat::CLI::CompactPostFormatter : USaidWat::CLI::PostFormatter).new
        ENV['LESS'] = 'RS' if oneline
        page
        posts.each { |p| print formatter.format(p) }
      end

      def process_tally(options, args)
        raise ArgumentError.new('You must specify a username') if args.empty?
        raise ArgumentError.new('You cannot specify a subreddit when tallying comments') if args.count > 1
        username = args.first

        redditor = client.new(username)
        quit "#{redditor.username} has no posts." if redditor.posts.empty?
        partition_data = partition(redditor.posts, options['count'])
        formatter = USaidWat::CLI::TallyFormatter.new
        print formatter.format(partition_data)
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end
    end
  end
end
