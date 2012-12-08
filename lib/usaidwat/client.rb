require 'snooby'

module USaidWat
  module Client
    class ReachabilityError < RuntimeError; end
    
    class Redditor
      attr_reader :username
      
      def initialize(username)
        enable_test_urls if ENV['USAIDWAT_ENV'] == 'cucumber'
        @username = username
        @service  = Snooby::Client.new("usaidwat v#{USaidWat::VERSION}")
      end
      
      def comments
        @service.user(username).comments(100)
      rescue TypeError
        raise ReachabilityError, "Reddit unreachable"
      end
      
      private
        def enable_test_urls
          Snooby::Paths.each { |k,v| Snooby::Paths[k] = v.sub(%r{http://www.reddit.com}, "http://localhost:4567") }
        end
    end
  end
end
