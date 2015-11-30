require 'spec_helper'
require 'usaidwat/algo'
require 'usaidwat/count'


module USaidWat
  module Application
    describe CountCommand do
      before(:all) do
        Struct.new('Comment', :subreddit)
      end

      let (:stub) { Class.new { include CountCommand }.new }

      let(:comments) do
        c1 = Array.new(20) { Struct::Comment.new('AskReddit') }
        c2 = Array.new(20) { Struct::Comment.new('programming') }
        c3 = Array.new(19) { Struct::Comment.new('Python') }
        c4 = Array.new(20) { Struct::Comment.new('books') }
        c5 = Array.new(21) { Struct::Comment.new('ruby') }
        c1 + c2 + c3 + c4 + c5
      end

      describe '#algorithm' do
        it 'sorts entries by subreddit name' do
          expect(stub.algorithm(true)).to eq(USaidWat::Algorithms::CountAlgorithm)
        end

        it 'sorts entries by count' do
          expect(stub.algorithm(false)).to eq(USaidWat::Algorithms::LexicographicalAlgorithm)
        end
      end

      describe '#partition' do
        it 'partitions data and returns the longest subreddit' do
          res = stub.partition(comments, false)
          expect(res.longest).to eq('programming'.length)
        end

        it 'partitions data and returns the partitioned data' do
          res = stub.partition(comments, false)
          expect(res.counts.count).to eq(5)
          expect(res.counts.first.first).to eq('AskReddit')
          expect(res.counts.last.first).to eq('ruby')
        end

        it 'partitions data, sorting by count, and returns the longest subreddit' do
          res = stub.partition(comments, true)
          expect(res.longest).to eq('programming'.length)
        end

        it 'partitions data, sorting by count, and returns the partitioned data' do
          res = stub.partition(comments, true)
          expect(res.counts.count).to eq(5)
          expect(res.counts.first.first).to eq('ruby')
          expect(res.counts.last.first).to eq('Python')
        end
      end
    end
  end
end
