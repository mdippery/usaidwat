require 'sysexits'
require 'usaidwat/client'
require 'usaidwat/pager'

require 'timecop' if ENV['USAIDWAT_ENV'] == 'cucumber'

module USaidWat
  module Application
    class Command
      include Pager
      include Sysexits

      attr_reader :client

      class << self
        def subclasses
          @subclasses ||= []
        end

        def inherited(base)
          subclasses << base
          super
        end
      end

      def initialize(prog)
        @client = cucumber? ? USaidWat::Client::TestRedditor : USaidWat::Client::Redditor
        Timecop.freeze(Time.parse(ENV['USAIDWAT_CURRENT_TIME'])) if cucumber_time?
      end

      def quit(message, code=:ok)
        stream = code == :ok ? $stdout : $stderr
        stream.puts message
        exit code
      end

      protected

      def cucumber?
        ENV['USAIDWAT_ENV'] == 'cucumber'
      end

      def cucumber_time?
        cucumber? && !ENV['USAIDWAT_CURRENT_TIME'].nil?
      end
    end
  end
end
