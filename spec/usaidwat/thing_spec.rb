require 'spec_helper'
require 'json'

module USaidWat
  module Thing
    describe User do
      let(:user_data) { JSON.parse(IO.read('features/fixtures/user_mipadi.json')) }
      let(:comment_data) { JSON.parse(IO.read('features/fixtures/mipadi.json')) }
      let(:post_data) { JSON.parse(IO.read('features/fixtures/submissions_mipadi.json')) }
      let(:user) { User.new('mipadi', user_data, comment_data, post_data) }

      describe '#about' do
        let(:about) { user.about }

        it "returns the user's username" do
          expect(about['name']).to eq('mipadi')
        end

        it "returns the user's link karma" do
          expect(about['link_karma']).to eq(4892)
        end

        it "returns the user's comment karma" do
          expect(about['comment_karma']).to eq(33440)
        end

        it "returns the date the user created their account" do
          expect(about['created_utc']).to eq(1207004126)
          expect(Time.at(about['created_utc'])).to eq(Time.new(2008, 3, 31, 15, 55, 26, '-07:00'))
        end
      end

      describe '#comments' do
        it 'returns 100 comments' do
          expect(user.comments(100).count).to eq(100)
        end
      end

      describe '#posts' do
        it 'returns 25 posts' do
          expect(user.posts.count).to eq(25)
        end
      end
    end

    describe Comment do
      let(:data) { JSON.parse(IO.read('features/fixtures/mipadi.json'))['data']['children'][0] }
      let(:comment) { Comment.new(data) }

      describe '#subreddit' do
        it 'should return the name of the subreddit to which the comment belongs' do
          expect(comment.subreddit).to eq('wikipedia')
        end
      end

      describe '#body' do
        it "should return the comment's body" do
          expect(comment.body).to eq('Yep. My first experience with a Heisenbug occurred in a C++ program, and disappeared when I tried to print a variable with printf (only to reappear when that call was removed).')
        end
      end

      describe '#id' do
        it "should return the comment's ID" do
          expect(comment.id).to eq('c79peed')
        end
      end

      describe '#link_id' do
        it "should return the comment's link ID" do
          expect(comment.link_id).to eq('t3_142t4w')
        end
      end

      describe '#link_title' do
        it "should return the title of the link to which the comment belongs" do
          expect(comment.link_title).to eq('Heisenbug: a software bug that seems to disappear or alter its behavior when one attempts to study it')
        end
      end

      describe '#ups' do
        it "should return the number of upvotes" do
          expect(comment.ups).to eq(1)
        end
      end

      describe '#downs' do
        it "should return the number of downvotes" do
          expect(comment.downs).to eq(0)
        end
      end

      describe '#created_utc' do
        it "should return the date the comment was written" do
          expected = Time.new(2012, 12, 1, 12, 14, 28, '-08:00')
          expect(comment.created_utc).to eq(expected)
        end
      end
    end

    describe Submission do
      let(:data) { JSON.parse(IO.read('features/fixtures/submissions_mipadi.json'))['data']['children'][0] }
      let(:post) { Submission.new(data) }

      describe '#subreddit' do
        it "should return the post's subreddit" do
          expect(post.subreddit).to eq('short')
        end
      end

      describe '#title' do
        it "should return the post's title" do
          expect(post.title).to eq('Science Says Being Short Makes You Depressed')
        end
      end

      describe '#permalink' do
        it "should return the post's permalink" do
          expect(post.permalink).to eq('/r/short/comments/3pj7rx/science_says_being_short_makes_you_depressed/')
        end
      end

      describe '#url' do
        it "should return the post's URL" do
          expect(post.url).to eq('http://www.vice.com/read/it-sucks-to-be-a-short-guy-511')
        end
      end

      describe '#created_utc' do
        it "should return the time the post was created" do
          expected = Time.new(2015, 10, 20, 12, 36, 37, '-07:00')
          expect(post.created_utc).to eq(expected)
        end
      end
    end
  end
end
