require 'stringio'
require 'rainbow'

Sickill::Rainbow.enabled = true unless ENV['USAIDWAT_ENV'] == 'cucumber'

module USaidWat
  module CLI
    class CommentFormatter
      def initialize
        @count = 0
      end
      
      def format(comment)
        out = StringIO.new
        out.write("\n\n") unless @count == 0
        out.write("#{comment.subreddit}\n".color(:green))
        out.write("#{comment_link(comment)}\n".color(:yellow))
        out.write("\n")
        out.write("#{comment.body.strip}\n")
        @count += 1
        out.rewind
        out.read
      end
      
      private
        def comment_link(comment)
          link = comment.link_id.split("_")[-1]
          "http://www.reddit.com/r/#{comment.subreddit}/comments/#{link}/z/#{comment.id}"
        end
    end
  end
end
