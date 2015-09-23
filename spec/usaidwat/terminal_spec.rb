require 'spec_helper'

module USaidWat
  module Application
    describe Terminal do
      let (:terminal) { Terminal.new }

      describe "#width" do
        it "should return a positive integer" do
          expect(terminal.width).to be > 0
        end
      end

      describe "#height" do
        it "should return a positive integer" do
          expect(terminal.height).to be > 0
        end
      end
    end
  end
end
