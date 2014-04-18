require 'spec_helper'

module USaidWat
  module Service
    describe MockService do
      let (:service) { MockService.new }

      describe "#user" do
        it "returns a mock user" do
          service.user("mipadi").should respond_to(:comments)
        end
      end
    end

    describe MockUser do
      let (:user) { MockUser.new("mipadi") }

      describe "#comments" do
        it "should return an array of comments" do
          user.comments(100).should respond_to(:count)
          user.comments(100).should respond_to(:reject)
          user.comments(100).should respond_to(:empty?)
          user.comments(100).should respond_to(:each)
          user.comments(100).count.should == 100
        end
      end
    end

    describe MockComment do
      let (:comment) { MockUser.new("mipadi").comments(100).first }

      describe "#subreddit" do
        it "should return a string denoting what subreddit it belongs to" do
          comment.subreddit.should == "wikipedia"
        end
      end

      describe "#body" do
        it "should return the comment's body" do
          comment.body.should == "Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed)."
        end
      end

      describe "#id" do
        it "should return an ID" do
          comment.id.should == "c79peed"
        end
      end

      describe "#link_id" do
        it "should return a link ID" do
          comment.link_id.should == "t3_142t4w"
        end
      end
    end
  end
end
