require 'rubygems'
require 'usaidwat'

module USaidWat extend self
  def show
    damn show_usage unless ARGV.length == 2
    
    reddit_user = USaidWat::RedditUser.new ARGV.shift
    comment = ARGV.shift
    Dir.chdir(reddit_user.comments_dir) do
      Dir['*'].each do |subreddit|
        Dir.chdir(subreddit) do
          Dir['*'].each do |comment_file|
            if comment == comment_file
              puts File.open(comment_file).read
              exit 0
            end
          end
        end
      end
    end
    damn "Comment for user #{reddit_user.username} with ID #{comment} could not be found.", 10
  end
  
  def show_tag
    'Show a specific comment from a user'
  end
  
  def show_usage
    'Usage: usaidwat show <user> <comment>'
  end
end
