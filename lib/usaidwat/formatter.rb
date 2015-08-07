require 'date'
require 'highline'
require 'stringio'
require 'rainbow/ext/string'
require 'usaidwat/ext/string'
require 'usaidwat/ext/time'

Rainbow.enabled = true unless ENV['USAIDWAT_ENV'] == 'cucumber'

module USaidWat
  module CLI
    class CommentFormatter
      def initialize
        @count = 0
      end

      def format(comment)
        cols = HighLine::SystemExtensions.terminal_size[0]
        out = StringIO.new
        out.write("\n\n") unless @count == 0
        out.write("#{comment.subreddit}\n".color(:green))
        out.write("#{comment_link(comment)}\n".color(:yellow))
        out.write("#{comment.link_title.strip.truncate(cols)}\n".color(:red))
        out.write("#{comment_date(comment)}\n".color(:blue))
        out.write("\n")
        out.write("#{comment.body.strip.convert_entities}\n")
        @count += 1
        out.rewind
        out.read
      end
      
      private
        def comment_link(comment)
          link = comment.link_id.split("_")[-1]
          "http://www.reddit.com/r/#{comment.subreddit}/comments/#{link}/z/#{comment.id}"
        end

        def comment_date(comment)
          DateTime.strptime(comment.created_utc.to_s, "%s").to_time.localtime.ago
        end
    end

    class CompactCommentFormatter
      def format(comment)
        cols = HighLine::SystemExtensions.terminal_size[0]
        out = StringIO.new
        subreddit = comment.subreddit
        cols -= subreddit.length + 1
        out.write("#{subreddit}".color(:green))
        out.write(" #{comment.link_title.strip.truncate(cols)}\n")
        out.rewind
        out.read
      end
    end
  end
end
