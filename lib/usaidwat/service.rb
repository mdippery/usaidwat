module USaidWat
  module Service
    class MockComment
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

    class MockSubmission
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

    class MockUser
      def initialize(username)
        @username = username
      end

      def about
        user_data
      end

      def comments(n)
        comment_data['children'].map { |d| MockComment.new(d) }
      end

      def posts
        post_data['children'].map { |d| MockSubmission.new(d) }
      end

      private

      def user_data
        load_data("user_#{@username}.json")['data']
      end

      def comment_data
        load_data("#{@username}.json")['data']
      end

      def post_data
        load_data("submissions_#{@username}.json")['data']
      end

      def load_data(data_file)
        path = File.join(File.dirname(__FILE__), "..", "..", "features", "fixtures", data_file)
        raise USaidWat::Client::NoSuchUserError, @username unless File.exists?(path)
        JSON.parse(IO.read(path))
      end
    end

    class MockService
      def user(username)
        MockUser.new(username)
      end
    end
  end
end
