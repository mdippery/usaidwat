require 'snooby'

module USaidWat
  module Client
    class Redditor
      attr_reader :username
      
      def initialize(username)
        @username = username
        @service  = Snooby::Client.new("usaidwat v#{USaidWat::VERSION}")
      end
      
      def comments
        @service.user(username).comments(100)
      end
    end
  end
end
