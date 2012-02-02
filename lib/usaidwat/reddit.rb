require 'fileutils'
require 'net/http'
require 'time'

require 'rubygems'
require 'json'


class Hash
  def to_query
    data = keys.inject([]) { |parts, key| parts << [URI.encode(key.to_s), URI.encode(self[key].to_s)] }
    data.map{ |t| t.join '=' }.join '&'
  end
end

module USaidWat
  class RedditUser
    COMMENT_COUNT = 100
    COMMENTS_PER_PAGE = 25
    CACHE_AGE = 300
    
    attr_reader :username
    
    def initialize(username)
      @username = username
    end
    
    def profile_url
      "http://www.reddit.com/user/#{username}"
    end
    
    def comments_url
      "#{profile_url}/comments"
    end
    
    def last_update
      return Time.at 0 unless File.exists? cache_timestamp_file
      Time.parse File.open(cache_timestamp_file).read.chomp
    end
    
    def update_cache(force=false)
      FileUtils.mkdir_p cache_dir
      
      is_outdated = Time.now - last_update > CACHE_AGE
      if force or is_outdated
        FileUtils.rm_rf cache_dir
        FileUtils.mkdir_p cache_dir
        
        comments = Array.new
        after = nil
        pages = COMMENT_COUNT / COMMENTS_PER_PAGE
        pages.times do |i|
          query = i == 0 ? '' : {:count => COMMENTS_PER_PAGE, :after => after}.to_query
          url = "#{comments_url}.json?#{query}"
          resp = Net::HTTP.get_response 'www.reddit.com', url
          unless resp.code.to_i == 200
            $stderr.puts "Could not retrieve comments: #{resp.message}"
            return nil
          end
          resp = JSON.parse resp.body
          if resp.key? 'error'
            $stderr.puts "Could not retrieve comments: #{resp['error'] || 'Unknown error'}"
            return nil
          end
          comments += resp['data']['children']
          after = resp['data']['after']
        end
        cache_comments comments
      end
    end
    
    def retrieve_comments
      update_cache
      subreddits = Hash.new { |h,k| h[k] = 0 }
      Dir.chdir(comments_dir) do
        Dir['*'].each do |sr|
          next unless File.directory? sr
          Dir["#{sr}/*"].each { |f| subreddits[sr] += 1 }
        end
      end
      subreddits.sort { |a,b| b[1] <=> a[1] }
    end
    
    def comments_for_subreddit(subreddit)
      update_cache
      comments = []
      subreddit_dir = File.join comments_dir, subreddit
      return nil unless File.exists? subreddit_dir
      Dir.chdir(subreddit_dir) do
        Dir['*'].each do |f|
          path = File.join subreddit_dir, f
          comment = File.open(path).read.chomp
          comments << comment
        end
      end
      comments
    end
    
    def to_s
      "Reddit user: #{username}"
    end
    
    private
      def cache_dir
        File.join USaidWat::BASE_CACHE_DIR, username
      end

      def cache_timestamp_file
        File.join cache_dir, 'updated'
      end

      def comments_dir
        File.join cache_dir, 'comments'
      end
      
      def cache_comments(comments)
        comments.each do |c|
          cid = c['data']['id']
          sr = c['data']['subreddit']
          body = c['data']['body']
          parent_cache_dir = subreddit_directory! sr
          cache_file = File.join parent_cache_dir, cid
          File.open(cache_file, 'w') { |f| f.write body }
        end
        File.open(cache_timestamp_file, 'w') { |f| f.write Time.now }
      end
      
      def subreddit_directory!(subreddit)
        path = File.join comments_dir, subreddit
        FileUtils.mkdir_p path
        path
      end
  end
end
