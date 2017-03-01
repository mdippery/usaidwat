require 'usaidwat/client'
require 'usaidwat/command'
require 'usaidwat/filter'
require 'usaidwat/formatter'
require 'usaidwat/ext/array'

module USaidWat
  module Application
    class Log < Command
      include FilterCommand

      def initialize(prog)
        prog.command(:log) do |c|
          c.alias :l
          c.option 'date', '--date FORMAT', 'Show dates in "absolute" or "relative" format'
          c.option 'grep', '--grep STRING', 'Show only comments matching STRING'
          c.option 'limit', '--limit LIMIT', '-n LIMIT', 'Only show n comments'
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
              lambda { |r| grep_entries('comments', redditor, r.value, options['grep'], subreddits) } >>
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
        ENV['LESS'] = 'RS' if options[:oneline]
        page
        comments.each { |c| print formatter.format(c) }
      end
    end
  end
end
