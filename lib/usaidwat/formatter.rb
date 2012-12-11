require 'stringio'

module USaidWat
  module CLI
    class CommentFormatter
      def initialize
        @count = 0
      end
      
      def format(comment)
        out = StringIO.new
        out.write("#{hr}\n") unless @count == 0
        out.write("#{comment.subreddit}\n")
        out.write("#{comment_link(comment)}\n")
        out.write("\n")
        out.write("#{comment.body}\n")
        out.rewind
        out.read
      end
      
      private
        def hr
          "-" * 80
        end
        
        def comment_link(comment)
          link = comment.link_id.split("_")[-1]
          "http://www.reddit.com/r/#{comment.subreddit}/comments/#{link}/z/#{comment.id}"
        end
    end
  end
end
