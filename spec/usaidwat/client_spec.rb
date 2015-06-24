require 'spec_helper'

module USaidWat
  module Client
    describe Client do
      let(:redditor) { Redditor.new("mipadi") }
      
      describe "#username" do
        it "returns the Redditor's username" do
          expect(redditor.username).to eq("mipadi")
        end
      end
      
      describe "#to_s" do
        it "returns a string representing the Redditor" do
          expect("#{redditor}").to eq("mipadi")
        end
      end
      
      context "when Reddit is up" do
        before(:each) do
          WebMock.disable_net_connect!
          WebMock.reset!
          root = File.expand_path("../../../features/fixtures", __FILE__)
          stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?after=&limit=100").
            to_return(:body => IO.read(File.join(root, "mipadi.json")))
        end
      
        describe "#comments" do
          it "retrieves 100 comments" do
            expect(redditor.comments.count).to eq(100)
          end
        end
      end

      context "when a Reddit user does not exist" do
        before(:each) do
          WebMock.disable_net_connect!
          WebMock.reset!
          root = File.expand_path("../../../features/fixtures", __FILE__)
          stub_request(:get, "http://www.reddit.com/user/testuser/comments.json?after=&limit=100").
            to_return(:status => 404, :body => IO.read(File.join(root, "testuser.json")))
        end

        describe "#comments" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").comments }.to raise_error(NoSuchUserError, /testuser/)
          end
        end
      end
      
      context "when Reddit is down" do
        before(:each) do
          WebMock.disable_net_connect!
          WebMock.reset!
          stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?after=&limit=100").
            to_return(:status => 500)
        end
        
        describe "#comments" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.comments }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end
      end
    end
  end
end
