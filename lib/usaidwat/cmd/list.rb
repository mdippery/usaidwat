require 'rubygems'
require 'usaidwat'

module USaidWat extend self
  def list
    damn list_usage unless ARGV.length == 2
    
    reddit_user = USaidWat::RedditUser.new ARGV.shift
    subreddit = ARGV.shift
    comments = reddit_user.comments_for_subreddit subreddit
    is_first = true
    width = `tput cols`.to_i rescue 80
    comments.each do |c|
      puts '-' * width unless is_first
      puts c
      is_first = false
    end
  end
  
  def list_tag
    "Show user's last 100 comments for a given subreddit"
  end
  
  def list_usage
    'Usage: usaidwat list <user> <subreddit>'
  end
end
