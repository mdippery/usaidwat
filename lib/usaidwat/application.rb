module USaidWat
  class << self
    def application
      @application ||= USaidWat::Application.new
    end
  end
  
  class Application
    def run(argv)
      @opts, args = handle_arguments(argv)
    end
    
    def usage(code=0)
      puts "Usage: usaidwat [--tally] <user> [<subreddit>]"
      exit code
    end
    
    def version(code=0)
      puts "usaidwat v#{USaidWat::VERSION}"
    end
    
    private
      def handle_arguments(argv)
        usage if argv.first == "--help"
        version if argv.first == "--version"
        opts = {:tally => false}
        if argv.first == "--tally"
          opts[:tally] = true
          argv.shift
          usage(1) if argv.length > 1
        end
        [opts, argv]
      end
  end
end
