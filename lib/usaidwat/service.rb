require 'requests'

module USaidWat
  module Service
    class RedditService
      def user(username)
        data = %w{about comments submitted}.reduce({}) { |memo, obj| memo.update(obj.to_sym =>  get_page(username, obj)) }
        USaidWat::Thing::User.new(username, data[:about], data[:comments], data[:submitted])
      end

      private

      def get_page(username, page)
        url = "https://www.reddit.com/user/#{username}/#{page}.json"
        url += '?limit=100' if ['comments', 'submitted'].include?(page)
        get(url)
      end

      def get(uri)
        hdrs = {'User-Agent' => "usaidwat v#{USaidWat::VERSION}"}
        Requests.request('GET', uri, :headers => hdrs).json
      rescue Requests::Error => e
        case e.response.code.to_i
        when 404 then :no_such_user
        when 500 then :server_error
        else          :nil
        end
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
