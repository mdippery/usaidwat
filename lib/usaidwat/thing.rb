module USaidWat
  module Thing
    module Timestampable
      def created_utc
        Time.at(@created_utc)
      end
    end

    module HashBackedIvars
      def method_missing(symbol, *args, &block)
        res = @data[symbol.to_s]
        return res unless res.nil?
        super
      end
    end

    class User
      def initialize(username, user_data, comment_data, post_data)
        @username = username
        @user_data = user_data
        @comment_data = comment_data
        @post_data = post_data
      end

      def about
        raise USaidWat::Client::NoSuchUserError, @username if @user_data == :no_such_user
        raise USaidWat::Client::ReachabilityError, "Reddit unreachable" if @user_data == :server_error
        @about ||= About.new(@user_data)
      end

      def comments(n)
        comment_data['children'].map { |d| Comment.new(d) }
      end

      def posts
        post_data['children'].map { |d| Submission.new(d) }
      end

      def method_missing(symbol, *args, &block)
        if symbol.to_s =~ /_data$/
          begin
            res = instance_variable_get("@#{symbol}")
            raise USaidWat::Client::NoSuchUserError, @username if res == :no_such_user
            raise USaidWat::Client::ReachabilityError, "Reddit unreachable" if res == :server_error
            res['data']
          rescue NameError
            super
          end
        else
          super
        end
      end
    end

    class About
      include Timestampable
      include HashBackedIvars

      def initialize(dict)
        @data = dict['data']
        @created_utc = @data['created_utc']
      end
    end

    class Comment
      include Timestampable
      include HashBackedIvars

      def initialize(dict)
        @data = dict['data']
        @created_utc = @data['created_utc']
      end
    end

    class Submission
      include Timestampable
      include HashBackedIvars

      def initialize(dict)
        @data = dict['data']
        @created_utc = @data['created_utc']
      end
    end
  end
end
