module USaidWat
  module Client
    class Redditor
      attr_reader :username
      
      def initialize(username)
        @username = username
      end
      
      def comments
        []
      end
    end
  end
end
