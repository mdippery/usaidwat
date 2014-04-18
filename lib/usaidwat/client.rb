require 'snooby'
require 'usaidwat/service'

module USaidWat
  module Client
    class ReachabilityError < RuntimeError; end

    class BaseRedditor
      attr_reader :username

      def initialize(username)
        @username = username
      end

      def comments
        @service.user(username).comments(100)
      rescue TypeError
        raise ReachabilityError, "Reddit unreachable"
      end

      def to_s
        "#{username}"
      end
    end

    class Redditor < BaseRedditor
      def initialize(username)
        @service = Snooby::Client.new("usaidwat v#{USaidWat::VERSION}")
        super
      end
    end

    class TestRedditor < BaseRedditor
      def initialize(username)
        @service = USaidWat::Service::MockService.new
        super
      end
    end
  end
end
