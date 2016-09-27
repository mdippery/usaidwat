module USaidWat
  module CLI
    class TimelineFormatter
      include TTYFormatter

      def format(comment_data)
        out = StringIO.new
        out.write(' ')
        (0..23).each { |h| out.write(sprintf '%3s', h) }
        out.write("\n")

        comment_data.each_with_index do |day, i|
          out.write(day_map(i))
          day.each do |hour|
            mark = hour > 0 ? '*' : ' '
            out.write(sprintf "%3s", mark)
          end
          out.write("\n")
        end

        out.rewind
        out.read
      end

      private

      def day_map(i)
        return %W{S M T W T F S}[i]
      end
    end
  end
end
