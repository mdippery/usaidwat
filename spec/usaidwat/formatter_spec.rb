require 'spec_helper'

module USaidWat
  module CLI
    describe CommentFormatter do
      let(:formatter) { CommentFormatter.new }
      
      describe "#format" do
        it "should format a comment" do
          comment = double("comment")
          comment.should_receive(:subreddit).and_return("programming")
          comment.should_receive(:link_id).and_return("t3_13f783")
          comment.should_receive(:id).and_return("c73qhxi")
          comment.should_receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          expected = <<-EXPECTED
programming
http://www.reddit.com/r/programming/comments/13f783/z/c73qhxi

Welcome to the wonderful world of Python drama!
EXPECTED
          actual = formatter.format(comment)
          actual.should == expected
        end
      end
    end
  end
end
