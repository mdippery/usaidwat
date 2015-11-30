require 'spec_helper'
require 'usaidwat/filter'

module USaidWat
  module Application
    describe FilterCommand do
      before(:all) do
        Struct.new('Redditor', :username)
        Struct.new('Comment', :subreddit, :body)
      end

      let (:stub) { Class.new { include FilterCommand }.new}
      let (:redditor) { Struct::Redditor.new('mipadi') }

      let (:comments) do
        c1 = Array.new(50) { Struct::Comment.new('AskReddit', 'The quick brown fox jumps over the lazy dog.') }
        c2 = Array.new(50) { Struct::Comment.new('Python', 'How razorback-jumping frogs can level six piqued gynmasts!') }
        c1 + c2
      end

      describe '#filter_entries' do
        it 'returns entries filtered by subreddit' do
          res = stub.filter_entries('', redditor, comments, ['python'])
          expect(res.right?).to be true
          expect(res.value.count).to eq(50)
        end

        it 'returns an empty object if all entries are filtered' do
          res = stub.filter_entries('', redditor, comments, ['nsfw'])
          expect(res.left?).to be true
        end

        it 'returns all the entries if no subreddit is specified' do
          res = stub.filter_entries('', redditor, comments, [])
          expect(res.right?).to be true
          expect(res.value).to eq(comments)
        end
      end

      describe '#grep_entries' do
        it 'returns entries filtered by search string' do
          res = stub.grep_entries('', redditor, comments, 'fox')
          expect(res.right?).to be true
          expect(res.value.count).to eq(50)
        end

        it 'returns an empty object if all entries are filtered' do
          res = stub.grep_entries('', redditor, comments, 'blah')
          expect(res.left?).to be true
        end

        it 'returns all the entries if no search string is specified' do
          res = stub.grep_entries('', redditor, comments, nil)
          expect(res.right?).to be true
          expect(res.value).to eq(comments)
        end
      end

      describe '#limit_entries' do
        it 'returns a specified number of entries' do
          entries = (1..100).to_a
          res = stub.limit_entries('', nil, entries, 10)
          expect(res.right?).to be true
          expect(res.value.count).to eq(10)
        end

        it 'returns all the entries if the limit is nil' do
          entries = (1..100).to_a
          res = stub.limit_entries('', nil, entries, nil)
          expect(res.right?).to be true
          expect(res.value.count).to eq(entries.count)
        end
      end
    end
  end
end
