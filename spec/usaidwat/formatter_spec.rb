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
          actual = formatter.format(comment).delete_ansi_color_codes
          actual.should == expected
        end
        
        it "should print two spaces between comments" do
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
          lines = s.split("\n")
          lines[0].should == ''
          lines[1].should == ''
          lines[2].should_not == ""
        end
        
        it "should strip leading and trailing whitespace from comments" do
          comment = double(comment)
          comment.should_receive(:subreddit).twice.and_return("test")
          comment.should_receive(:link_id).and_return("t3_13f783")
          comment.should_receive(:id).and_return("c73qhxi")
          comment.should_receive(:body).and_return("This is a comment.\n\nIt has two lines.\n\n\n")
          s = formatter.format(comment)
          lines = s.split("\n")
          lines[-1].should == "It has two lines."
        end
      end
    end
  end
end
