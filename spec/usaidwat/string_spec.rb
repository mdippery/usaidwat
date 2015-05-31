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

        it "converts both &gt; and &lt; to <" do
          s = "look -&gt; this string has both &lt;- awesome, huh?"
          expected = "look -> this string has both <- awesome, huh?"
          actual = s.convert_entities
          expect(actual).to eq(expected)
        end
      end
    end
  end
end
