require 'spec_helper'

module USaidWat
  module CLI
    describe CommentFormatter do
      let(:formatter) { CommentFormatter.new }
      
      describe "#format" do
        it "should return a string containing the formatted comment" do
          comment = double("comment")
          comment.should_receive(:subreddit).twice.and_return("programming")
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
        
        it "should print a horizontal rule for subsequent comments" do
          expected = "-" * 80
          comment1 = double("first comment")
          comment1.should_receive(:subreddit).twice.and_return("programming")
          comment1.should_receive(:link_id).and_return("t3_13f783")
          comment1.should_receive(:id).and_return("c73qhxi")
          comment1.should_receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          comment2 = double("second comment")
          comment2.should_receive(:subreddit).twice.and_return("programming")
          comment2.should_receive(:link_id).and_return("t3_13f783")
          comment2.should_receive(:id).and_return("c73qhxi")
          comment2.should_receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          s = formatter.format(comment1)
          s = formatter.format(comment2)
          actual = s.split("\n")[0]
          actual.should == expected
        end
      end
    end
  end
end
