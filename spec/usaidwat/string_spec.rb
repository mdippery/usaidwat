require 'rainbow'
require 'spec_helper'

module USaidWat
  module Ext
    describe String do
      describe "#prefix_subreddit" do
        it "should add /r/ to the beginning of strings" do
          s = "wikipedia"
          expect(s.prefix_subreddit).to eq("/r/wikipedia")
        end

        it "should return an empty string if the string itself is empty" do
          expect(''.prefix_subreddit).to eq('')
        end
      end

      describe "#unescape_html" do
        it "transforms &amp; to &" do
          s = "this &amp; that"
          expect(s.unescape_html).to eq("this & that")
        end

        it "transform &lt; to <" do
          s = "chocolate &lt; vanilla"
          expect(s.unescape_html).to eq("chocolate < vanilla")
        end

        it "transforms &gt; to >" do
          s = "cats &gt; dogs"
          expect(s.unescape_html).to eq("cats > dogs")
        end
      end

      describe "#pluralize" do
        it "should not append an 's' to a singular noun" do
          s = "dog"
          expect(s.pluralize(1)).to eq(s)
        end

        it "should append an 's' to a plural noun" do
          s = "dog"
          expect(s.pluralize(2)).to eq("dogs")
        end

        it "should append an 's' to a noun with count 0" do
          s = "dog"
          expect(s.pluralize(0)).to eq("dogs")
        end

        it "should append 'ies' to a plural noun" do
          s = "popp"
          expect(s.pluralize(2, "ies", "y")).to eq("poppies")
        end

        it "should not append 'ies' to a singular noun" do
          s = "popp"
          expect(s.pluralize(1, "ies", "y")).to eq("poppy")
        end
      end

      describe "#highlight" do
        it "should highlight matching parts of strings" do
          s = "apple pie is made from apples"
          expected = "#{Rainbow("apple").red} pie is made from #{Rainbow("apple").red}s"
          actual = s.highlight("apple")
          expect(actual).to eq(expected)
        end

        it "should return an identical string if no matches are found" do
          s = "apple pie is made from apples"
          expected = s.dup
          actual = s.highlight("cherry")
          expect(actual).to eq(expected)
        end

        it "should match parts insensitive to case" do
          s = "Apple pie is made from Apples"
          expected = "#{Rainbow("Apple").red} pie is made from #{Rainbow("Apple").red}s"
          actual = s.highlight("apple")
          expect(actual).to eq(expected)
        end

        it "should highlight matching parts of strings using a regex-like string" do
          s = "pears are tastier than bears"
          expected = "#{Rainbow("pears").red} are tastier than #{Rainbow("bears").red}"
          actual = s.highlight("[b|p]ears")
          expect(actual).to eq(expected)
        end

        it "should highlight matching parts of strings using an actual regex" do
          s = "pears are tastier than bears"
          expected = "#{Rainbow("pears").red} are tastier than #{Rainbow("bears").red}"
          actual = s.highlight(/[b|p]ears/)
          expect(actual).to eq(expected)
        end
      end
    end
  end
end
