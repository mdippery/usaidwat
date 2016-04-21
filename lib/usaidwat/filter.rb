require 'usaidwat/either'

module USaidWat
  module Application
    module FilterCommand
      def filter_entries(noun, redditor, entries, subreddits)
        return USaidWat::Right.new(entries) if subreddits.empty?
        entries = entries.find_all { |e| subreddits.include?(e.subreddit.downcase) }
        if entries.empty?
          USaidWat::Left.new("No #{noun} by #{redditor.username} for #{subreddits.join(', ')}.")
        else
          USaidWat::Right.new(entries)
        end
      end

      def grep_entries(noun, redditor, entries, grep)
        return USaidWat::Right.new(entries) if grep.nil?
        entries = entries.select { |e| e.body =~ /#{grep}/i }
        if entries.empty?
          msg = "#{redditor.username} has no #{noun} matching /#{grep}/."
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
