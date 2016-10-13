require 'unirest'

module USaidWat
  module Service
    class RedditService
      USER_AGENT = "usaidwat v#{USaidWat::VERSION}"

      def user(username)
        data = {}
        %w{about comments submitted}.each do |page|
          url = "https://www.reddit.com/user/#{username}/#{page}.json"
          hdrs = {'User-Agent' => USER_AGENT}
          r = Unirest.get(url, :headers => hdrs)
          data[page.to_sym] = case r.code
                              when 404 then :no_such_user
                              when 500 then :server_error
                              else          r.body
                              end
        end
        USaidWat::Thing::User.new(username, data[:about], data[:comments], data[:submitted])
      end
    end

    class MockService
      def user(username)
        USaidWat::Thing::User.new(username,
                                  load_data("user_#{username}.json"),
                                  load_data("#{username}.json"),
                                  load_data("submissions_#{username}.json"))
      end

      private

      def load_data(data_file)
        path = File.join(File.dirname(__FILE__), "..", "..", "features", "fixtures", data_file)
        return :no_such_user unless File.exists?(path)
        JSON.parse(IO.read(path))
      end
    end
  end
end
