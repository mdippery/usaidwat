require 'spec_helper'

module USaidWat
  module Algorithms
    describe LexicographicalAlgorithm do
      let (:algo) { LexicographicalAlgorithm.new(nil) }

      it "should return -1 if the first object is before the second" do
        expect(algo.sort("a", "b")).to eq(-1)
      end

      it "should return 1 if the first object is after the second" do
        expect(algo.sort("b", "a")).to eq(1)
      end

      it "should return 0 if the objects are equal" do
        expect(algo.sort("a", "a")).to eq(0)
      end

      it "should ignore case when comparing objects that are ordered" do
        expect(algo.sort("a", "B")).to eq(-1)
      end

      it "should ignore case when comparing objects that are ordered in reverse" do
        expect(algo.sort("B", "a")).to eq(1)
      end

      it "should ignore case when comparing equal objects" do
        expect(algo.sort("A", "a")).to eq(0)
      end
    end

    describe CountAlgorithm do
      let (:algo) { CountAlgorithm.new({"a" => 10, "b" => 20, "c" => 5, "d" => 10}) }

      it "should return -1 if the first object has a higher count than the second" do
        expect(algo.sort("b", "a")).to eq(-1)
      end

      it "should return 1 if the first object has a lower count than the second" do
        expect(algo.sort("a", "b")).to eq(1)
      end

      it "should return -1 if the objects have the same count but the first occurs first alphabetically" do
        expect(algo.sort("a", "d")).to eq(-1)
      end

      it "should return 1 if the objects have the same count but the second occurs first alphabetically" do
        expect(algo.sort("d", "a")).to eq(1)
      end
    end
  end
end
