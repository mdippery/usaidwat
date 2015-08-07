require 'spec_helper'
require 'timecop'

module USaidWat
  module CLI
    describe CommentFormatter do
      let(:formatter) { CommentFormatter.new }

      before do
        Timecop.freeze(Time.new(2015, 6, 16, 17, 8))
      end

      after do
        Timecop.return
      end
      
      describe "#format" do
        it "should return a string containing the formatted comment" do
          comment = double("comment")
          expect(comment).to receive(:subreddit).twice.and_return("programming")
          expect(comment).to receive(:link_id).and_return("t3_13f783")
          expect(comment).to receive(:id).and_return("c73qhxi")
          expect(comment).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment).to receive(:created_utc).and_return(1433378314.0)
          expect(comment).to receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          expected = <<-EXPECTED
programming
http://www.reddit.com/r/programming/comments/13f783/z/c73qhxi
Why Brit Ruby 2013 was cancelled and why this is not ok - Gist
about 2 weeks ago

Welcome to the wonderful world of Python drama!
EXPECTED
          actual = formatter.format(comment).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end
        
        it "should print two spaces between comments" do
          comment1 = double("first comment")
          expect(comment1).to receive(:subreddit).twice.and_return("programming")
          expect(comment1).to receive(:link_id).and_return("t3_13f783")
          expect(comment1).to receive(:id).and_return("c73qhxi")
          expect(comment1).to receive(:created_utc).and_return(1433378314.0)
          expect(comment1).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment1).to receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          comment2 = double("second comment")
          expect(comment2).to receive(:subreddit).twice.and_return("programming")
          expect(comment2).to receive(:link_id).and_return("t3_13f783")
          expect(comment2).to receive(:id).and_return("c73qhxi")
          expect(comment2).to receive(:created_utc).and_return(1433378314.0)
          expect(comment2).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment2).to receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          s = formatter.format(comment1)
          s = formatter.format(comment2)
          lines = s.split("\n")
          expect(lines[0]).to eq('')
          expect(lines[1]).to eq('')
          expect(lines[2]).not_to eq('')
        end
        
        it "should strip leading and trailing whitespace from comments" do
          comment = double(comment)
          expect(comment).to receive(:subreddit).twice.and_return("test")
          expect(comment).to receive(:link_id).and_return("t3_13f783")
          expect(comment).to receive(:id).and_return("c73qhxi")
          expect(comment).to receive(:created_utc).and_return(1433378314.0)
          expect(comment).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment).to receive(:body).and_return("This is a comment.\n\nIt has two lines.\n\n\n")
          s = formatter.format(comment)
          lines = s.split("\n")
          expect(lines[-1]).to eq("It has two lines.")
        end
      end
    end

    describe CompactCommentFormatter do
      let (:formatter) { CompactCommentFormatter.new }

      before do
        Timecop.freeze(Time.new(2015, 6, 16, 17, 8))
      end

      after do
        Timecop.return
      end

      describe "#format" do
        it "should return a string containing the formatted comment" do
          comment = double("comment")
          expect(comment).to receive(:subreddit).and_return("programming")
          expect(comment).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expected = "programming Why Brit Ruby 2013 was cancelled and why this is not ok - Gist\n"
          actual = formatter.format(comment).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end
      end
    end
  end
end
