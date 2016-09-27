module USaidWat
  module CLI
    class PostFormatter < BaseFormatter
      def format(post)
        cols = tty.width
        out = StringIO.new
        out.write("\n\n\n") unless @count == 0
        out.write("#{post.subreddit}\n".color(:green))
        out.write("#{post_link(post)}\n".color(:yellow))
        out.write("#{post.title.strip.unescape_html.truncate(cols)}\n".color(:magenta))
        out.write("#{post_date(post)}".color(:blue))
        out.write("\n#{post.url}") unless post.url.end_with?(post.permalink)
        @count += 1
        out.rewind
        out.read
      end

      private

      def post_link(post)
        "https://www.reddit.com#{post.permalink.split('/')[0..-2].join('/')}"
      end

      def post_date(post)
        Time.at(post.created_utc).ago
      end
    end

    class CompactPostFormatter < BaseFormatter
      def format(post)
        cols = tty.width
        out = StringIO.new
        subreddit = post.subreddit
        cols -= subreddit.length + 1
        title = post.title.strip.unescape_html.truncate(cols)
        out.write(subreddit.color(:green))
        out.write(" #{title}\n")
        out.rewind
        out.read
      end
    end
  end
end
