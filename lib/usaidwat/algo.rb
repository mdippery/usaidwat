module USaidWat
  module Algorithms
    class Algorithm
      attr_reader :buckets

      def initialize(buckets)
        @buckets = buckets
      end

      def sort(a, b)
        a <=> b
      end
    end

    class LexicographicalAlgorithm < Algorithm
      def sort(a, b)
        a.downcase <=> b.downcase
      end
    end

    class CountAlgorithm < Algorithm
      def sort(a, b)
        if buckets[a] == buckets[b]
          a.downcase <=> b.downcase
        else
          buckets[b] <=> buckets[a]
        end
      end
    end
  end
end
