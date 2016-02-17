require 'spec_helper'
require 'timecop'

module USaidWat
  module CLI
    describe BaseFormatter do
      describe "options" do
        describe "date formats" do
          describe "#relative_dates?" do
            it "should return true if a relative date formatter" do
              f = BaseFormatter.new(:date_format => :relative)
              expect(f.relative_dates?).to be true
            end

            it "should return true if relative date option is passed as a string" do
              f = BaseFormatter.new(:date_format => 'relative')
              expect(f.relative_dates?).to be true
            end

            it "should return false if date format is absolute" do
              f = BaseFormatter.new(:date_format => :absolute)
              expect(f.relative_dates?).to be false
            end

            it "should return false if date format is absolute and is passed as a string" do
              f = BaseFormatter.new(:date_format => 'absolute')
              expect(f.relative_dates?).to be false
            end

            it "should use relative dates by default" do
              f = BaseFormatter.new
              expect(f.relative_dates?).to be true
            end

            it "should use relative dates when a date format is invalid" do
              f = BaseFormatter.new(:date_format => :iso)
              expect(f.relative_dates?).to be true
            end
          end
        end

        describe "patterns" do
          let (:formatter) { BaseFormatter.new(:pattern => /[0-9]+/) }
          describe "#pattern" do
            it "should return its pattern" do
              expect(formatter.pattern).to eq(/[0-9]+/)
            end

            it "should return nil if it does not have a pattern" do
              f = BaseFormatter.new
              expect(f.pattern).to be nil
            end
          end

          describe "#pattern?" do
            it "should return true if it has a pattern" do
              expect(formatter.pattern?).to be true
            end

            it "should return false if it does not have a pattern" do
              f = BaseFormatter.new
              expect(f.pattern?).to be false
            end

            it "should return false by default" do
              f = BaseFormatter.new
              expect(f.pattern?).to be false
            end
          end
        end

        describe "#raw?" do
          it "should return true if it is a raw formatter" do
            f = BaseFormatter.new(:raw => true)
            expect(f.raw?).to be true
          end

          it "should return false if it is not a raw formatter" do
            f = BaseFormatter.new(:raw => false)
            expect(f.raw?).to be false
          end

          it "should return false by default" do
            f = BaseFormatter.new
            expect(f.raw?).to be false
          end
        end
      end
    end

    describe PostFormatter do
      let(:formatter) { PostFormatter.new }

      before do
        Timecop.freeze(Time.new(2015, 11, 19, 15, 27))
      end

      after do
        Timecop.return
      end

      describe "#format" do
        it "should return a string containing the formatted post" do
          post = double("post")
          expect(post).to receive(:subreddit).and_return("Games")
          expect(post).to receive(:permalink).twice.and_return("/r/Games/comments/3ovldc/the_xbox_one_is_garbage_and_the_future_is_bullshit/")
          expect(post).to receive(:title).and_return("The Xbox One Is Garbage And The Future Is Bullshit")
          expect(post).to receive(:created_utc).and_return(1444928064)
          expect(post).to receive(:url).twice.and_return("http://adequateman.deadspin.com/the-xbox-one-is-garbage-and-the-future-is-bullshit-1736054579")
          expected = <<-EXPECTED
Games
https://www.reddit.com/r/Games/comments/3ovldc
The Xbox One Is Garbage And The Future Is Bullshit
about 1 month ago
http://adequateman.deadspin.com/the-xbox-one-is-garbage-and-the-future-is-bullshit-1736054579
EXPECTED
          expected = expected.strip
          actual = formatter.format(post).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end

        it "should not include the URL if it is the same as the permalink" do
          permalink = "/r/Games/comments/3ovldc/the_xbox_one_is_garbage_and_the_future_is_bullshit/"
          post = double("post")
          expect(post).to receive(:subreddit).and_return("Games")
          expect(post).to receive(:permalink).twice.and_return(permalink)
          expect(post).to receive(:title).and_return("The Xbox One Is Garbage And The Future Is Bullshit")
          expect(post).to receive(:created_utc).and_return(1444928064)
          expect(post).to receive(:url).and_return("https://www.reddit.com#{permalink}")
          expected = <<-EXPECTED
Games
https://www.reddit.com/r/Games/comments/3ovldc
The Xbox One Is Garbage And The Future Is Bullshit
about 1 month ago
EXPECTED
          expected = expected.strip
          actual = formatter.format(post).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end

        it "should print two spaces between posts" do
          post1 = double("first post")
          expect(post1).to receive(:subreddit).and_return("Games")
          expect(post1).to receive(:permalink).twice.and_return("/r/Games/comments/3ovldc/the_xbox_one_is_garbage_and_the_future_is_bullshit/")
          expect(post1).to receive(:title).and_return("The Xbox One Is Garbage And The Future Is Bullshit")
          expect(post1).to receive(:created_utc).and_return(1444928064)
          expect(post1).to receive(:url).twice.and_return("http://adequateman.deadspin.com/the-xbox-one-is-garbage-and-the-future-is-bullshit-1736054579")
          post2 = double("second post")
          expect(post2).to receive(:subreddit).and_return("technology")
          expect(post2).to receive(:permalink).twice.and_return("/r/technology/comments/3o0vrh/mozilla_lays_out_a_proposed_set_of_rules_for/")
          expect(post2).to receive(:title).and_return("Mozilla lays out a proposed set of rules for content blockers")
          expect(post2).to receive(:created_utc).and_return(1444340278)
          expect(post2).to receive(:url).twice.and_return("https://blog.mozilla.org/blog/2015/10/07/proposed-principles-for-content-blocking/")
          s = formatter.format(post1)
          s = formatter.format(post2)
          lines = s.split("\n")
          expect(lines[0]).to eq('')
          expect(lines[1]).to eq('')
          expect(lines[2]).to eq('')
          expect(lines[3]).not_to eq('')
        end

        it "should truncate titles to 80 characters" do
          post = double("post")
          expect(post).to receive(:subreddit).and_return("webdev")
          expect(post).to receive(:permalink).twice.and_return("/r/webdev/comments/29og3m/sick_of_ruby_dynamic_typing_side_effects_and/")
          expect(post).to receive(:title).and_return("Sick of Ruby, dynamic typing, side effects, and basically object-oriented programming")
          expect(post).to receive(:created_utc).and_return(1404331670)
          expect(post).to receive(:url).twice.and_return("https://blog.abevoelker.com/sick-of-ruby-dynamic-typing-side-effects-object-oriented-programming/")
          expected = <<-EXPECTED
webdev
https://www.reddit.com/r/webdev/comments/29og3m
Sick of Ruby, dynamic typing, side effects, and basically object-oriented progra
about a year ago
https://blog.abevoelker.com/sick-of-ruby-dynamic-typing-side-effects-object-oriented-programming/
EXPECTED
          expected = expected.strip
          actual = formatter.format(post).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end
      end
    end

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
          expect(comment).to receive(:ups).and_return(12)
          expect(comment).to receive(:downs).and_return(1)
          expect(comment).to receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          expected = <<-EXPECTED
programming
http://www.reddit.com/r/programming/comments/13f783/z/c73qhxi
Why Brit Ruby 2013 was cancelled and why this is not ok - Gist
about 2 weeks ago \u2022 +11

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
          expect(comment1).to receive(:ups).and_return(12)
          expect(comment1).to receive(:downs).and_return(1)
          expect(comment1).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment1).to receive(:body).and_return("Welcome to the wonderful world of Python drama!")
          comment2 = double("second comment")
          expect(comment2).to receive(:subreddit).twice.and_return("programming")
          expect(comment2).to receive(:link_id).and_return("t3_13f783")
          expect(comment2).to receive(:id).and_return("c73qhxi")
          expect(comment2).to receive(:created_utc).and_return(1433378314.0)
          expect(comment2).to receive(:ups).and_return(12)
          expect(comment2).to receive(:downs).and_return(1)
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
          expect(comment).to receive(:ups).and_return(12)
          expect(comment).to receive(:downs).and_return(1)
          expect(comment).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          expect(comment).to receive(:body).and_return("This is a comment.\n\nIt has two lines.\n\n\n")
          s = formatter.format(comment)
          lines = s.split("\n")
          expect(lines[-1]).to eq("It has two lines.")
        end

        it "should format HTML entities in post titles" do
          comment = double("first comment")
          expect(comment).to receive(:subreddit).twice.and_return("guitars")
          expect(comment).to receive(:link_id).and_return("t3_13f783")
          expect(comment).to receive(:id).and_return("c73qhxi")
          expect(comment).to receive(:created_utc).and_return(1433378314.0)
          expect(comment).to receive(:ups).and_return(12)
          expect(comment).to receive(:downs).and_return(1)
          expect(comment).to receive(:link_title).and_return("[GEAR] My 06 Fender EJ Strat, an R&amp;D prototype sold at NAMM")
          expect(comment).to receive(:body).and_return("Lorem ipsum")
          s = formatter.format(comment).delete_ansi_color_codes
          lines = s.split("\n")
          expect(lines[2]).to eq("[GEAR] My 06 Fender EJ Strat, an R&D prototype sold at NAMM")
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

        it "should format HTML entities in titles" do
          comment = double("comment")
          expect(comment).to receive(:subreddit).and_return("guitars")
          expect(comment).to receive(:link_title).and_return("[GEAR] My 06 Fender EJ Strat, an R&amp;D prototype sold at NAMM")
          expected = "guitars [GEAR] My 06 Fender EJ Strat, an R&D prototype sold at NAMM\n"
          actual = formatter.format(comment).delete_ansi_color_codes
          expect(actual).to eq(expected)
        end

        it "should return an empty string if a comment has already been printed" do
          comment1 = double("comment")
          comment2 = double("comment")
          expect(comment1).to receive(:subreddit).and_return("programming")
          expect(comment1).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          _ = formatter.format(comment1).delete_ansi_color_codes
          expect(comment2).to receive(:subreddit).and_return("programming")
          expect(comment2).to receive(:link_title).and_return("Why Brit Ruby 2013 was cancelled and why this is not ok - Gist")
          actual = formatter.format(comment2).delete_ansi_color_codes
          expect(actual).to eq("")
        end
      end
    end

    describe TallyFormatter do
      before(:all) do
        Struct.new('PartitionData', :longest, :counts)
      end

      let (:formatter) { TallyFormatter.new }

      describe '#format' do
        it 'should format partitioned data' do
          longest_subreddit = 'writing'.length
          count_data = [['apple', 5], ['Bass', 1], ['Python', 3], ['writing', 10]]
          partition = Struct::PartitionData.new(longest_subreddit, count_data)
          expected = <<-EOS
apple      5
Bass       1
Python     3
writing   10
EOS
          actual = formatter.format(partition)
          expect(actual).to eq(expected)
        end
      end
    end
  end
end
