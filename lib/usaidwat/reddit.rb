require 'fileutils'
require 'net/http'
require 'time'

require 'rubygems'
require 'json'


class Hash
  def to_query
    data = self.keys.inject([]) { |parts, key| parts << [URI.encode(key.to_s), URI.encode(self[key].to_s)] }
    data.map{ |t| t.join '=' }.join '&'
  end
end

module USaidWat
  class RedditUser
    COMMENT_COUNT = 100
    COMMENTS_PER_PAGE = 25
    
    attr_reader :username
    
    def initialize(username)
      @username = username
      self.ensure_cache_dir!
    end
    
    def profile_url
      "http://www.reddit.com/user/#{self.username}"
    end
    
    def comments_url
      "#{self.profile_url}/comments"
    end
    
    def last_update
      return Time.at 0 unless File.exists? self.cache_timestamp_file
      Time.parse File.open(self.cache_timestamp_file).read.chomp
    end
    
    def retrieve_comments(options={})
      return self.retrieve_comments_from_cache unless Time.now - self.last_update > 300
      count = options[:count] || COMMENT_COUNT
      cache = options[:cache] || true
      self.destroy_cache!
      comments = self.fetch_comments count
      return nil unless comments
      self.cache_comments comments if cache
      subreddits = Hash.new { |h,k| h[k] = 0 }
      comments.each do |comment|
        subreddit = comment['data']['subreddit'].to_sym
        subreddits[subreddit] += 1
      end
      subreddits.sort { |a,b| b[1] <=> a[1] }
    end
    
    def comments_for_subreddit(subreddit)
      self.retrieve_comments
      comments = []
      subreddit_dir = File.join self.comments_dir, subreddit
      Dir.chdir(subreddit_dir) do
        Dir['*'].each do |f|
          path = File.join subreddit_dir, f
          comment = File.open(path).read.chomp
          comments << comment
        end
      end
      comments
    end
    
    def retrieve_comments_from_cache
      subreddits = Hash.new { |h,k| h[k] = 0 }
      Dir.chdir(self.comments_dir) do
        Dir['*'].each do |sr|
          next unless File.directory? sr
          Dir["#{sr}/*"].each { |f| subreddits[sr] += 1 }
        end
      end
      subreddits.sort { |a,b| b[1] <=> a[1] }
    end
    
    def fetch_comments(count)
      comments = Array.new
      after = nil
      last_page = count / COMMENTS_PER_PAGE
      (1..last_page).each do |i|
        query = i == 1 ? '' : {:count => COMMENTS_PER_PAGE, :after => after}.to_query
        url = "#{self.comments_url}.json?#{query}"
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
      comments
    end
    
    def cache_comments(comments)
      comments.each do |c|
        cid = c['data']['id']
        sr = c['data']['subreddit']
        body = c['data']['body']
        parent_cache_dir = self.subreddit_directory! sr
        cache_file = File.join parent_cache_dir, cid
        File.open(cache_file, 'w') { |f| f.write body }
      end
      File.open(self.cache_timestamp_file, 'w') { |f| f.write Time.now }
    end
    
    def cache_dir
      File.join USaidWat::BASE_CACHE_DIR, self.username
    end
    
    def cache_timestamp_file
      File.join self.cache_dir, 'updated'
    end
    
    def comments_dir
      File.join self.cache_dir, 'comments'
    end
    
    def subreddit_directory!(subreddit)
      Dir.mkdir self.comments_dir unless File.exists? self.comments_dir
      cache = File.join self.comments_dir, subreddit
      Dir.mkdir cache unless File.exists? cache
      cache
    end
    
    def ensure_cache_dir!
      Dir.mkdir USaidWat::BASE_CACHE_DIR unless File.exists? USaidWat::BASE_CACHE_DIR
      Dir.mkdir self.cache_dir unless File.exists? self.cache_dir
    end
    
    def destroy_cache!
      FileUtils.rm_rf self.cache_dir
      self.ensure_cache_dir!
    end
    
    def to_s
      "Reddit user: #{self.username}"
    end
  end
end
