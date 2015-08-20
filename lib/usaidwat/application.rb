require 'sysexits'
require 'thor'
require 'usaidwat/pager'

module USaidWat
  class Application < Thor
    include Pager
    include Sysexits

    class << self
      def client
        ENV['USAIDWAT_ENV'] == 'cucumber' ? USaidWat::Client::TestRedditor : USaidWat::Client::Redditor
      end

      def exit_on_failure?
        true
      end
    end

    map '--version' => :version
    map 't' => :tally
    map 'l' => :log

    desc 'tally USERNAME', 'Count comments by subreddit'
    option :count, :aliases => '-c', :type => :boolean, :desc => 'Sort output by number of comments'
    def tally(username)
      redditor = Application.client.new(username)
      algo_cls = options[:count] ? USaidWat::Algorithms::CountAlgorithm : USaidWat::Algorithms::LexicographicalAlgorithm
      quit "#{redditor.username} has no comments." if redditor.comments.empty?
      # Unfortunately Snooby cannot return comments for a specific
      # user in a specific subreddit, so for now we have to sort them
      # ourself.
      longest_subreddit = 0
      buckets = Hash.new { |hash, key| hash[key] = 0 }
      redditor.comments.each do |comment|
        subreddit = comment.subreddit
        longest_subreddit = subreddit.length if subreddit.length > longest_subreddit
        buckets[subreddit] += 1
      end
      algo = algo_cls.new(buckets)
      subreddits = buckets.keys.sort { |a,b| algo.sort(a, b) }
      subreddits.each do |subreddit|
        tally = buckets[subreddit]
        printf "%-*s  %3d\n", longest_subreddit, subreddit, tally
      end
    rescue USaidWat::Client::NoSuchUserError
      quit "No such user: #{username}", :no_such_user
    end

    desc 'log USERNAME [SUBREDDIT]', 'Show comments by a user'
    option :grep, :type => :string, :banner => 'STRING', :desc => 'Show only comments matching string'
    option :oneline, :type => :boolean, :desc => 'Output log in a more compact form'
    def log(username, subreddit = nil)
      redditor = Application.client.new(username)
      comments = redditor.comments
      if subreddit
        comments = comments.group_by { |c| c.subreddit.downcase }
        comments = comments[subreddit.downcase]
        quit "No comments by #{redditor.username} for #{subreddit}." if comments.nil?
      end
      comments = comments.select { |c| c.body =~ /#{options[:grep]}/i } if options[:grep]
      if comments.empty?
        msg = "#{redditor.username} has no comments"
        msg = "#{msg} matching /#{options[:grep]}/" if options[:grep]
        msg = "#{msg}."
        quit msg
      end
      list_comments(comments, options[:grep], options[:oneline])
    rescue USaidWat::Client::NoSuchUserError
      quit "No such user: #{username}", :no_such_user
    end

    desc 'version', 'Show version info and exit'
    def version
      puts "usaidwat v#{USaidWat::VERSION}"
    end

    no_commands do
      def list_comments(comments, pattern = nil, oneline = false)
        formatter = (oneline ? USaidWat::CLI::CompactCommentFormatter : USaidWat::CLI::CommentFormatter).new(pattern)
        page
        comments.each { |c| print formatter.format(c) }
      end

      def quit(message, code=:ok)
        puts message
        exit code
      end
    end
  end
end
