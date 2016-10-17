require 'usaidwat/service'
require 'usaidwat/ext/time'

module USaidWat
  module Client
    class ReachabilityError < RuntimeError
      def initialize(msg = nil)
        super(msg || 'Reddit unreachable')
      end
    end

    class NoSuchUserError < StandardError; end

    class BaseRedditor
      attr_reader :username

      def initialize(username)
        @username = username
      end

      def comments
        user.comments(100)
      rescue NoMethodError
        raise NoSuchUserError, username
      rescue RuntimeError
        raise ReachabilityError
      end

      def link_karma
        about.link_karma
      end

      def comment_karma
        about.comment_karma
      end

      def created_at
        about.created_utc
      end

      def age
        (Time.now - created_at).ago
      end

      def to_s
        "#{username}"
      end

      def posts
        user.posts
      rescue NoMethodError
        raise NoSuchUserError, username
      rescue RuntimeError
        raise ReachabilityError
      end

      private

      def user
        @service.user(username)
      end

      def about
        user.about
      rescue NoMethodError
        raise NoSuchUserError, username
      end
    end

    class Redditor < BaseRedditor
      def initialize(username)
        @service = USaidWat::Service::RedditService.new
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
