require 'snooby'

module USaidWat
  module Client
    class ReachabilityError < RuntimeError; end
    
    class Redditor
      attr_reader :username
      
      def initialize(username)
        @username = username
        @service  = Snooby::Client.new("usaidwat v#{USaidWat::VERSION}")
      end
      
      def comments
        @service.user(username).comments(100)
      rescue TypeError
        raise ReachabilityError, "Reddit unreachable"
      end
    end
  end
end
