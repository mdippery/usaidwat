module USaidWat
  module Application
    class Timeline < Command
      def initialize(prog)
        prog.command(:timeline) do |c|
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
        comments = redditor.comments

        quit "#{username} has no comments." if comments.empty?

        buckets = comments_by_days_and_hours(comments)
        times = Array.new(7) { Array.new(24, 0) }
        buckets.each do |v|
          d, h = v
          times[d][h] += 1
        end

        formatter = USaidWat::CLI::TimelineFormatter.new
        puts formatter.format(times)
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end

      private

      def comments_by_days_and_hours(comments)
        comments.map { |c| [Time.at(c.created_utc).wday, Time.at(c.created_utc).hour] }
      end
    end
  end
end
