require 'usaidwat/either'

module USaidWat
  module Application
    module FilterCommand
      def filter_entries(noun, redditor, entries, subreddits, excluded_subreddits = [])
        return USaidWat::Right.new(entries) if subreddits.empty? && excluded_subreddits.empty?
        entries = entries.select { |e| subreddits.include?(e.subreddit.downcase) } unless subreddits.empty?
        entries = entries.reject { |e| excluded_subreddits.include?(e.subreddit.downcase) }
        if entries.empty?
          msg = "No #{noun} by #{redditor.username}"
          msg += " for #{subreddits.join(', ')}." unless subreddits.empty?
          USaidWat::Left.new(msg)
        else
          USaidWat::Right.new(entries)
        end
      end

      def grep_entries(noun, redditor, entries, grep, subreddits = [])
        return USaidWat::Right.new(entries) if grep.nil?
        entries = entries.select { |e| e.body =~ /#{grep}/i }
        if entries.empty?
          msg = "#{redditor.username} has no #{noun} matching /#{grep}/"
          unless subreddits.empty?
            prefixed_subs = subreddits.map(&:prefix_subreddit)
            msg += " in " + prefixed_subs.or_join
          end
          msg += "."
          USaidWat::Left.new(msg)
        else
          USaidWat::Right.new(entries)
        end
      end

      def limit_entries(noun, redditor, entries, n)
        return USaidWat::Right.new(entries) if n.nil?
        entries = entries[0...n.to_i]
        USaidWat::Right.new(entries)
      end

      def ensure_entries(noun, redditor, entries)
        if entries.empty?
          USaidWat::Left.new("#{redditor.username} has no #{noun}.")
        else
          USaidWat::Right.new(entries)
        end
      end
    end
  end
end
