require 'usaidwat/client'
require 'usaidwat/command'
require 'usaidwat/count'

module USaidWat
  module Application
    class Tally < Command
      include CountCommand

      def initialize(prog)
        prog.command(:tally) do |c|
          c.alias :t
          c.option 'count', '-c', '--count', 'Sort output by number of comments'

          c.action do |args, options|
            dispatch_process(:process, options, args)
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
        partition_data = partition(redditor.comments, options['count'])
        formatter = USaidWat::CLI::TallyFormatter.new
        print formatter.format(partition_data)
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end
    end
  end
end
