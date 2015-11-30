require 'date'
require 'downterm'
require 'rainbow/ext/string'
require 'redcarpet'
require 'set'
require 'stringio'
require 'ttycaca'
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
        @tty ||= Ttycaca::Terminal.new
      end
    end

    class PostFormatter < BaseFormatter
      def format(post)
        cols = tty.width
        out = StringIO.new
        out.write("\n\n\n") unless @count == 0
        out.write("#{post.subreddit}\n".color(:green))
        out.write("#{post_link(post)}\n".color(:yellow))
        out.write("#{post.title.strip.truncate(cols)}\n".color(:magenta))
        out.write("#{post_date(post)}".color(:blue))
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

    class CommentFormatter < BaseFormatter
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
        def markdown
          @markdown ||= Redcarpet::Markdown.new(Downterm::Render::Terminal, :autolink => true,
                                                                            :strikethrough => true,
                                                                            :superscript => true)
        end

        def comment_body(comment)
          body = comment.body.strip
          body = markdown.render(body) unless raw?
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
        title = comment.link_title.strip.truncate(cols)
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
        @comments ||= Set.new
      end

      def mark_seen(comment)
        comments << comment
      end

      def seen?(comment)
        comments.include?(comment)
      end
    end

    class TallyFormatter < BaseFormatter
      def format(partition_data)
        out = StringIO.new
        longest_subreddit = partition_data.longest
        subreddits = partition_data.counts
        subreddits.each do |subreddit_count|
          subreddit, tally = subreddit_count
          line = sprintf("%-*s  %3d\n", longest_subreddit, subreddit, tally)
          out.write(line)
        end
        out.rewind
        out.read
      end
    end
  end
end
