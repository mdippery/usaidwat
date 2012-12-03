require 'spec_helper'

module USaidWat
  module Client
    describe Client do
      before(:each) do
        root = File.expand_path("../../../test/responses", __FILE__)
        stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?after=&limit=100").
          to_return(:body => IO.read(File.join(root, "comments.json")))
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
