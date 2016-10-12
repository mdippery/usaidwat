module USaidWat
  module Service
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
        return nil unless File.exists?(path)
        JSON.parse(IO.read(path))
      end
    end
  end
end
