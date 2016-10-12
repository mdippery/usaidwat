module USaidWat
  module Thing
    class User
      def initialize(username, user_data, comment_data, post_data)
        @username = username
        @user_data = user_data
        @comment_data = comment_data
        @post_data = post_data
      end

      def about
        user_data
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
            raise USaidWat::Client::ReachabilityError if res == :server_error
            res['data']
          rescue NameError
            super
          end
        else
          super
        end
      end
    end

    class Comment
      attr_reader :subreddit, :body, :id, :link_id, :created_utc, :link_title, :ups, :downs

      def initialize(dict)
        data = dict['data']
        @subreddit = data['subreddit']
        @body = data['body']
        @id = data['id']
        @link_id = data['link_id']
        @created_utc = data['created_utc']
        @link_title = data['link_title']
        @ups = data['ups']
        @downs = data['downs']
      end
    end

    class Submission
      attr_reader :subreddit, :title, :created_utc, :permalink, :url

      def initialize(dict)
        data = dict['data']
        @subreddit = data['subreddit']
        @title = data['title']
        @created_utc = data['created_utc']
        @permalink = data['permalink']
        @url = data['url']
      end
    end
  end
end
