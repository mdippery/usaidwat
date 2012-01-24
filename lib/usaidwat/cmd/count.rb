require 'rubygems'
require 'usaidwat'

module USaidWat::Commands extend self
  def count
    reddit_user = USaidWat::RedditUser.new ARGV.shift
    comments = reddit_user.retrieve_comments
    exit 2 unless comments
    max_key = 1
    comments.each { |c| max_key = c.first.length if c.first.length > max_key }
    comments.each { |c| printf "%-*s  %s\n", max_key, c.first, c.last }
  end
end
