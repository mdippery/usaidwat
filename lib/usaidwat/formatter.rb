require 'date'
require 'downterm'
require 'rainbow/ext/string'
require 'redcarpet'
require 'stringio'
require 'tty-screen'
require 'usaidwat/ext/string'
require 'usaidwat/ext/time'

Rainbow.enabled = true unless ENV['USAIDWAT_ENV'] == 'cucumber'

module USaidWat
  module CLI
    class BaseFormatter
      def initialize(options = {})
        @options = options
        @count = 0
      end

      def pattern
        @options[:pattern]
      end

      def pattern?
        !!@options[:pattern]
      end

      def raw?
        !!@options[:raw]
      end

      def relative_dates?
        @options[:date_format].nil? || @options[:date_format].to_sym != :absolute
      end

      protected

        def tty
          @tty || TTY::Screen.new
        end
    end

    class CommentFormatter < BaseFormatter
      def initialize(options = {})
        @markdown = Redcarpet::Markdown.new(Downterm::Render::Terminal, :autolink => true,
                                                                        :strikethrough => true,
                                                                        :superscript => true)
        super
      end

      def format(comment)
        cols = tty.width
        out = StringIO.new
        out.write("\n\n") unless @count == 0
        out.write("#{comment.subreddit}\n".color(:green))
        out.write("#{comment_link(comment)}\n".color(:yellow))
        out.write("#{comment.link_title.strip.truncate(cols)}\n".color(:magenta))
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
        def comment_body(comment)
          body = comment.body.strip
          body = @markdown.render(body) unless raw?
          if pattern?
            body.highlight(pattern)
          else
            body
          end
        end

        def comment_link(comment)
          link = comment.link_id.split("_")[-1]
          "http://www.reddit.com/r/#{comment.subreddit}/comments/#{link}/z/#{comment.id}"
        end

        def comment_date(comment)
          d = DateTime.strptime(comment.created_utc.to_s, "%s").to_time.localtime
          if relative_dates?
            d.ago
          else
            d_part = d.strftime("%-d %b %Y")
            t_part = d.strftime("%l:%M %p").strip
            "#{d_part} #{t_part}"
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
        out.write("#{subreddit}".color(:green))
        out.write(" #{comment.link_title.strip.truncate(cols)}\n")
        out.rewind
        out.read
      end
    end
  end
end
