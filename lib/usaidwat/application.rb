module USaidWat
  class << self
    def application
      @application ||= USaidWat::Application.new
    end
  end
  
  class Application
    def run(argv)
      @opts, args = handle_arguments(argv)
      @redditor = USaidWat::Client::Redditor.new(args.first)
      return tally_comments if @opts[:tally]
    end
    
    def usage(code=0)
      puts "Usage: usaidwat [--tally] <user> [<subreddit>]"
      exit code
    end
    
    def version(code=0)
      puts "usaidwat v#{USaidWat::VERSION}"
    end
    
    def tally_comments
      # Unfortunately Snooby cannot return comments for a specific
      # user in a specific subreddit, so for now we have to sort them
      # ourself.
      longest_subreddit = 0
      buckets = Hash.new { |hash, key| hash[key] = 0 }
      @redditor.comments.each do |comment|
        subreddit = comment.subreddit
        longest_subreddit = subreddit.length if subreddit.length > longest_subreddit
        buckets[subreddit] += 1
      end
      subreddits = buckets.keys.sort { |a,b| a.downcase <=> b.downcase }
      subreddits.each do |subreddit|
        tally = buckets[subreddit]
        printf "%-*s  %s\n", longest_subreddit, subreddit, tally
      end
      exit 0
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
