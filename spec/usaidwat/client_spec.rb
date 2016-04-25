require 'spec_helper'
require 'timecop'

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
          stub_request(:get, "http://www.reddit.com/user/mipadi/about.json").
            to_return(:body => IO.read(File.join(root, "user_mipadi.json")))
          stub_request(:get, "http://www.reddit.com/user/mipadi/submitted.json?after=&limit=25").
            to_return(:body => IO.read(File.join(root, "submissions_mipadi.json")))

          Timecop.freeze(Time.new(2015, 9, 15, 11, 14, 30, "-07:00"))
        end

        after(:each) do
          Timecop.return
        end

        describe "#posts" do
          it "retrieves 25 posts" do
            expect(redditor.posts.count).to eq(25)
          end
        end

        describe "#comments" do
          it "retrieves 100 comments" do
            expect(redditor.comments.count).to eq(100)
          end
        end

        describe "#link_karma" do
          it "returns the user's link karma" do
            expect(redditor.link_karma).to eq(4892)
          end
        end

        describe "#comment_karma" do
          it "returns the user's comment karma" do
            expect(redditor.comment_karma).to eq(33440)
          end
        end

        describe "#created_at" do
          it "returns the date the account was created" do
            expected = Time.new(2008, 3, 31, 15, 55, 26, "-07:00")
            expect(redditor.created_at).to eq(expected)
          end
        end

        describe "#age" do
          it "returns a string describing the age of the account" do
            expected = "over 7 years ago"
            expect(redditor.age).to eq(expected)
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
          stub_request(:get, "http://www.reddit.com/user/testuser/about.json").
            to_return(:status => 404, :body => IO.read(File.join(root, "user_testuser.json")))
          stub_request(:get, "http://www.reddit.com/user/testuser/submitted.json?after=&limit=25").
            to_return(:status => 404, :body => IO.read(File.join(root, "submissions_testuser.json")))
        end

        describe "#posts" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").comments }.to raise_error(NoSuchUserError, /testuser/)
          end
        end

        describe "#comments" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").comments }.to raise_error(NoSuchUserError, /testuser/)
          end
        end

        describe "#link_karma" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").link_karma }.to raise_error(NoSuchUserError, /testuser/)
          end
        end

        describe "#comment_karma" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").comment_karma }.to raise_error(NoSuchUserError, /testuser/)
          end
        end

        describe "#created_at" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").created_at }.to raise_error(NoSuchUserError, /testuser/)
          end
        end

        describe "#age" do
          it "raises an exception if the user does not exist" do
            expect { Redditor.new("testuser").age }.to raise_error(NoSuchUserError, /testuser/)
          end
        end
      end

      context "when Reddit is down" do
        before(:each) do
          WebMock.disable_net_connect!
          WebMock.reset!
          stub_request(:get, "http://www.reddit.com/user/mipadi/comments.json?after=&limit=100").
            to_return(:status => 500)
          stub_request(:get, "http://www.reddit.com/user/mipadi/about.json").
            to_return(:status => 500)
          stub_request(:get, "http://www.reddit.com/user/mipadi/submitted.json?after=&limit=25").
            to_return(:status => 500)
        end

        describe "#posts" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.comments }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end

        describe "#comments" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.comments }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end

        describe "#link_karma" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.link_karma }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end

        describe "#comment_karma" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.comment_karma }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end

        describe "#created_at" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.created_at }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end

        describe "#age" do
          it "raises 'Reddit unreachable' error" do
            expect { redditor.age }.to raise_error(ReachabilityError, /Reddit unreachable/)
          end
        end
      end
    end
  end
end
