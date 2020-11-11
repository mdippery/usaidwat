require 'usaidwat/client'
require 'usaidwat/command'

module USaidWat
  module Application
    class Info < Command
      def initialize(prog)
        prog.command(:info) do |c|
          c.action do |args, options|
            dispatch_process(:process, options, args)
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
  end
end
