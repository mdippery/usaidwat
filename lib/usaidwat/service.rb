module USaidWat
  module Service
    class MockComment
      attr_reader :subreddit, :body, :id, :link_id

      def initialize(dict)
        data = dict['data']
        @subreddit = data['subreddit']
        @body = data['body']
        @id = data['id']
        @link_id = data['link_id']
      end
    end

    class MockUser
      def initialize(username)
        @username = username
      end

      def comments(n)
        path = File.join(File.dirname(__FILE__), "..", "..", "features", "fixtures", "#{@username}.json")
        json = IO.read(path)
        json = JSON.parse(json)
        json['data']['children'].map { |d| MockComment.new(d) }
      end
    end

    class MockService
      def user(username)
        MockUser.new(username)
      end
    end
  end
end
