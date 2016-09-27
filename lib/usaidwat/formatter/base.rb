require 'downterm'
require 'rainbow/ext/string'
require 'redcarpet'
require 'ttycaca'

module USaidWat
  module CLI
    module TTYFormatter
      def tty
        @tty ||= Ttycaca::Terminal.new
      end
    end

    class BaseFormatter
      include TTYFormatter

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
    end
  end
end
