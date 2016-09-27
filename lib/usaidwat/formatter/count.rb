module USaidWat
  module CLI
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
