require 'spec_helper'

module USaidWat
  module Service
    describe MockService do
      let (:service) { MockService.new }

      describe "#user" do
        it "returns a mock user" do
          expect(service.user("mipadi")).to respond_to(:comments)
        end
      end
    end

    describe MockUser do
      let (:user) { MockUser.new("mipadi") }

      describe "#comments" do
        it "should return an array of comments" do
          expect(user.comments(100)).to respond_to(:count)
          expect(user.comments(100)).to respond_to(:reject)
          expect(user.comments(100)).to respond_to(:empty?)
          expect(user.comments(100)).to respond_to(:each)
          expect(user.comments(100).count).to eq(100)
        end
      end
    end

    describe MockComment do
      let (:comment) { MockUser.new("mipadi").comments(100).first }

      describe "#subreddit" do
        it "should return a string denoting what subreddit it belongs to" do
          expect(comment.subreddit).to eq("wikipedia")
        end
      end

      describe "#body" do
        it "should return the comment's body" do
          expect(comment.body).to eq("Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).")
        end
      end

      describe "#id" do
        it "should return an ID" do
          expect(comment.id).to eq("c79peed")
        end
      end

      describe "#link_id" do
        it "should return a link ID" do
          expect(comment.link_id).to eq("t3_142t4w")
        end
      end
    end
  end
end
