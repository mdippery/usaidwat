require 'rubygems'
require 'usaidwat'

module USaidWat::Commands extend self
  def subreddit
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
end
