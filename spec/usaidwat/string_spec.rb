require 'rainbow'
require 'spec_helper'

module USaidWat
  module Ext
    describe String do
      describe "#convert_entities" do
        it "converts &gt; to >" do
          s = "-&gt; look at this!"
          expected = "-> look at this!"
          actual = s.convert_entities
          expect(actual).to eq(expected)
        end

        it "converts &lt; to <" do
          s = "left &lt;&lt; shift!"
          expected = "left << shift!"
          actual = s.convert_entities
          expect(actual).to eq(expected)
        end

        it "converts both &gt; and &lt; to > and <" do
          s = "look -&gt; this string has both &lt;- awesome, huh?"
          expected = "look -> this string has both <- awesome, huh?"
          actual = s.convert_entities
          expect(actual).to eq(expected)
        end

        it "converts &amp; to &" do
          s = "i like cake &amp; ice cream"
          expected = "i like cake & ice cream"
          actual = s.convert_entities
          expect(actual).to eq(expected)
        end
      end

      describe "#truncate" do
        it "truncates strings longer than the given width to the width" do
          n = 80
          s = "-" * n * 2
          expect(s.truncate(n).length).to eq(n)
        end

        it "does not change strings shorter than the given width" do
          n = 80
          s = "string"
          expect(s.truncate(n).length).to eq(s.length)
          expect(s.truncate(n).length).to be < n
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
