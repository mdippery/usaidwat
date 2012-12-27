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
      return list_comments_for_subreddit(args[1]) if args.length == 2
      return list_all_comments
    end
    
    def usage(code=0)
      puts "Usage: usaidwat [-t] <user> [<subreddit>]"
      exit code
    end
    
    def version(code=0)
      puts "usaidwat v#{USaidWat::VERSION}"
      exit 0
    end
    
    def quit(message, code=0)
      puts message
      exit code
    end
    
    def list_all_comments
      quit "#{@redditor.username} has no comments." if @redditor.comments.empty?
      formatter = USaidWat::CLI::CommentFormatter.new
      @redditor.comments.each { |c| print formatter.format(c) }
    end
    
    def list_comments_for_subreddit(subreddit)
      comments = @redditor.comments
      comments = comments.reject { |c| c.subreddit != subreddit }
      quit "No comments by #{@redditor.username} for #{subreddit}." if comments.empty?
      formatter = USaidWat::CLI::CommentFormatter.new
      comments.each { |c| print formatter.format(c) }
    end
    
    def tally_comments
      quit "#{@redditor.username} has no comments." if @redditor.comments.empty?
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
        printf "%-*s  %3d\n", longest_subreddit, subreddit, tally
      end
      exit 0
    end
    
    private
      def handle_arguments(argv)
        usage(1) if argv.length == 0
        usage if argv.first == "--help"
        version if argv.first == "--version"
        opts = {:tally => false}
        if argv.first == "-t"
          opts[:tally] = true
          argv.shift
          usage(1) unless argv.length == 1
        end
        [opts, argv]
      end
  end
end
