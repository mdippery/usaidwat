require 'sysexits'
require 'usaidwat/pager'

module USaidWat
  class << self
    def application
      client = ENV['USAIDWAT_ENV'] == 'cucumber' ? USaidWat::Client::TestRedditor : USaidWat::Client::Redditor
      @application ||= USaidWat::Application.new(client)
    end
  end

  class Application
    include Pager
    include Sysexits

    def initialize(client)
      @client = client
      Signal.trap("PIPE", "EXIT")
    end

    def run(argv)
      trap("INT") { puts; exit 0 }
      opts, args = handle_arguments(argv)
      username = args.first
      @redditor = @client.new(username)
      @algo = opts.algorithm
      begin
        return tally_comments if opts.tally
        return list_comments_for_subreddit(args[1]) if args.length == 2
        return list_all_comments
      rescue USaidWat::Client::NoSuchUserError
        quit "No such user: #{username}", :no_such_user
      end
    end

    def usage(code=:usage)
      puts "Usage: usaidwat [-t | -T] <user> [<subreddit>]"
      exit code
    end

    def version(code=:ok)
      puts "usaidwat v#{USaidWat::VERSION}"
      exit 0
    end

    def quit(message, code=:ok)
      puts message
      exit code
    end

    def list_all_comments
      quit "#{@redditor.username} has no comments." if @redditor.comments.empty?
      formatter = USaidWat::CLI::CommentFormatter.new
      page
      @redditor.comments.each { |c| print formatter.format(c) }
    end

    def list_comments_for_subreddit(subreddit)
      comments = @redditor.comments
      comments = comments.group_by { |c| c.subreddit.downcase }
      comments = comments[subreddit.downcase]
      quit "No comments by #{@redditor.username} for #{subreddit}." if comments.nil?
      formatter = USaidWat::CLI::CommentFormatter.new
      page
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
      algo = @algo.new(buckets)
      subreddits = buckets.keys.sort { |a,b| algo.sort(a, b) }
      subreddits.each do |subreddit|
        tally = buckets[subreddit]
        printf "%-*s  %3d\n", longest_subreddit, subreddit, tally
      end
      exit 0
    end

    private
      def handle_arguments(argv)
        opts = OpenStruct.new
        opts.tally = false
        opts.algorithm = USaidWat::Algorithms::LexicographicalAlgorithm
        usage if argv.length == 0
        usage(:ok) if argv.first == "--help"
        version if argv.first == "--version"
        if %W{-t -T}.include?(argv.first)
          opts.tally = true
          opts.algorithm = USaidWat::Algorithms::CountAlgorithm if argv.first == "-T"
          argv.shift
          usage unless argv.length == 1
        end
        [opts, argv]
      end
  end
end
