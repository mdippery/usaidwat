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
    end
  end
end
