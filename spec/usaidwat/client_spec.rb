require 'spec_helper'

module USaidWat
  module Client
    describe Client do
      before(:each) do
        root = File.expand_path("../../../test/responses", __FILE__)

        stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json").
          to_return(:body => IO.read(File.join(root, "comments_1.json")))
        stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?count=25&after=t1_c77kq1t").
          to_return(:body => IO.read(File.join(root, "comments_2.json")))
        stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?count=50&after=t1_c74e76h").
          to_return(:body => IO.read(File.join(root, "comments_3.json")))
        stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?count=75&after=t1_c73pvjp").
          to_return(:body => IO.read(File.join(root, "comments_4.json")))
      end
      
      let(:redditor) { Client::Redditor.new("mipadi") }
      
      describe "#username" do
        it "returns the Redditor's username" do
          redditor.username.should == "mipadi"
        end
      end
      
      describe "#comments" do
        it "gets 100 comments" do
          redditor.comments.count.should == 100
        end
      end
    end
  end
end
