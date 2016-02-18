require "../../spec_helper"

include Comb

describe Lib::Num::Digit do
  d = Lib::Num::Digit.new

  describe "#matches?" do
    it "returns true for any digit" do
      d.matches?("0").should be_true
      d.matches?("2").should be_true
      d.matches?("7").should be_true
    end

    it "returns false for any other characters" do
      d.matches?("a").should be_false
      d.matches?("b").should be_false
    end

    it "returns false for the empty string" do
      d.matches?("").should be_false
    end

    it "returns false for strings with multiple characters" do
      d.matches?("012").should be_false
    end
  end

  describe "#parse" do
    it "returns the result for an initial digit char" do
      d.parse("0").results.should eq([{ "0", "" }])
      d.parse("2a").results.should eq([{ "2", "a" }])
      d.parse("777").results.should eq([{ "7", "77" }])
    end

    it "returns a failure if the string doesn't start with a digit" do
      d.parse("a").failure?.should be_true
      d.parse("a12").failure?.should be_true
    end
  end
end
