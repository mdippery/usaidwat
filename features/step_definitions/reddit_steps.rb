Given /^the Reddit service returns comments for the user "(.*?)"$/ do |user|
  ROOT = File.expand_path("../../../test/responses", __FILE__)
  
  stub_request(:get, "http://www.reddit.com/user/#{user}/comments.json").
    to_return(:body => IO.read(File.join(ROOT, "comments_1.json")))
  stub_request(:get, "http://www.reddit.com/user/#{user}/comments.json?count=25&after=t1_c77kq1t").
    to_return(:body => IO.read(File.join(ROOT, "comments_2.json")))
  stub_request(:get, "http://www.reddit.com/user/#{user}/comments.json?count=50&after=t1_c74e76h").
    to_return(:body => IO.read(File.join(ROOT, "comments_3.json")))
  stub_request(:get, "http://www.reddit.com/user/#{user}/comments.json?count=75&after=t1_c73pvjp").
    to_return(:body => IO.read(File.join(ROOT, "comments_4.json")))
end
