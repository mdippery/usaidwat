require 'spec_helper'
require 'usaidwat/ext/array'

module USaidWat
  module Ext
    describe Array do
      describe "#subreddits" do
        it "should split args separated by spaces" do
          v = %W{one two three}
          expected = v
          actual = v.subreddits
          expect(actual).to eq(expected)
        end

        it "should split args separated by commas" do
          v = ['one,two,three']
          expected = %W{one two three}
          actual = v.subreddits
          expect(actual).to eq(expected)
        end

        it "should split args separated by plus signs" do
          v = ['one+two+three']
          expected = %W{one two three}
          actual = v.subreddits
          expect(actual).to eq(expected)
        end

        it "should downcase all args" do
          v = %W{one Two Three}
          expected = %W{one two three}
          actual = v.subreddits
          expect(actual).to eq(expected)
        end
      end

      describe "#or_join" do
        it "should return the first item if the array has one item" do
          v = ['wikipedia']
          expect(v.or_join).to eq("wikipedia")
        end

        it "should separate the last entry by 'or'" do
          v = ['wikipedia', 'programming']
          expect(v.or_join).to eq('wikipedia or programming')
        end

        it "should separate all entries with commas and add the word 'or'" do
          v = ['wikipedia', 'programming', 'AskReddit']
          expect(v.or_join).to eq('wikipedia, programming, or AskReddit')
        end

        it "should return an empty string for empty arrays" do
          v = []
          expect(v.or_join).to eq('')
        end
      end
    end
  end
end
