require 'word_wrap'
require 'word_wrap/core_ext'


module USaidWat
  module CLI
    class CommentFormatter < BaseFormatter
      def format(comment)
        cols = tty.width
        out = StringIO.new
        out.write("\n\n") unless @count == 0
        out.write("#{comment.subreddit}\n".color(:green))
        out.write("#{comment_link(comment)}\n".color(:yellow))
        out.write("#{comment.link_title.strip.unescape_html}\n".color(:magenta))
        out.write("#{comment_date(comment)}".color(:blue))
        out.write(" \u2022 ".color(:cyan))
        out.write(sprintf("%+d\n", comment_karma(comment)).color(:blue))
        out.write("\n")
        out.write("#{comment_body(comment)}\n")
        @count += 1
        out.rewind
        out.read
      end

      private

      def markdown
        @markdown ||= Redcarpet::Markdown.new(Downterm::Render::Terminal, :autolink => true,
                                                                          :strikethrough => true,
                                                                          :superscript => true)
      end

      def comment_body(comment)
        cols = tty.width
        body = comment.body.strip.unescape_html
        body = markdown.render(body) unless raw?
        body = body.highlight(pattern) if pattern?
        body.wrap(cols).chomp
      end

      def comment_link(comment)
        link = comment.link_id.split("_")[-1]
        "http://www.reddit.com/r/#{comment.subreddit}/comments/#{link}/z/#{comment.id}"
      end

      def comment_date(comment)
        d = comment.created_utc.localtime
        if relative_dates?
          d.ago
        else
          d_part = d.strftime("%a, %-d %b %Y")
          t_part = d.strftime("%l:%M %p").strip
          "#{d_part}, #{t_part}"
        end
      end

      def comment_karma(comment)
        comment.ups - comment.downs
      end
    end

    class CompactCommentFormatter < BaseFormatter
      def format(comment)
        cols = tty.width
        out = StringIO.new
        subreddit = comment.subreddit
        cols -= subreddit.length + 1
        title = comment.link_title.strip.unescape_html
        key = "#{subreddit} #{title}"
        if !seen?(key)
          out.write("#{subreddit}".color(:green))
          out.write(" #{title}\n")
        end
        mark_seen(key)
        out.rewind
        out.read
      end

      private

      def comments
        @comments ||= ::Set.new
      end

      def mark_seen(comment)
        comments << comment
      end

      def seen?(comment)
        comments.include?(comment)
      end
    end
  end
end
