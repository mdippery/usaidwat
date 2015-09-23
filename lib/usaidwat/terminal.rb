require 'highline'

module USaidWat
  module Application
    class Terminal
      def initialize
        @term = HighLine.new
      end

      def width
        @term.output_cols
      end

      def height
        @term.output_rows
      end
    end
  end
end
