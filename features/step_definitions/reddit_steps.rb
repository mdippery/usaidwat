Given /^the Reddit service returns comments for the user "(.*?)"$/ do |user|
  root = File.expand_path("../../../test/responses", __FILE__)
  stub_request(:get, "http://www.reddit.com/user/#{user}/comments.json?after=&limit=100").
    to_return(:body => IO.read(File.join(root, "comments.json")))
end
