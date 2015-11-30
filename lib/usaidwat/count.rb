require 'usaidwat/algo'

module USaidWat
  module Application
    module CountCommand
      def partition(entries, sort_by_count)
        longest_subreddit = 0
        buckets = Hash.new { |hash, key| hash[key] = 0 }
        entries.each do |e|
          subreddit = e.subreddit
          longest_subreddit = subreddit.length if subreddit.length > longest_subreddit
          buckets[subreddit] += 1
        end
        algo = algorithm(sort_by_count).new(buckets)
        subreddits = buckets.keys.sort { |a,b| algo.sort(a, b) }
        counts = subreddits.map { |s| buckets[s] }
        subreddit_counts = subreddits.zip(counts)
        partition_data = Struct.new(:longest, :counts)
        partition_data.new(longest_subreddit, subreddit_counts)
      end

      def algorithm(sort_by_count)
        sort_by_count ? USaidWat::Algorithms::CountAlgorithm : USaidWat::Algorithms::LexicographicalAlgorithm
      end
    end
  end
end
