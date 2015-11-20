require 'spec_helper'
require 'usaidwat/ext/array'

module USaidWat
  module Ext
    describe Array do
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
  end
end
