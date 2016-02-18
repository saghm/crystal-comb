require "../spec_helper"

include Comb

describe Lib::Chars do
  xyz = Lib::Chars.new("xyz")

  describe "#matches?" do
    it "returns true for any of the given characters" do
      xyz.matches?("x").should be_true
      xyz.matches?("y").should be_true
      xyz.matches?("z").should be_true
    end

    it "returns false for any other characters" do
      xyz.matches?("a").should be_false
      xyz.matches?("b").should be_false
    end

    it "returns false for the empty string" do
      xyz.matches?("").should be_false
    end
  end

  describe "#parse" do
    it "returns the result for that char for one of the given chars" do
      xyz.parse("x").results.should eq([{ "x", "" }])
      xyz.parse("y").results.should eq([{ "y", "" }])
      xyz.parse("z").results.should eq([{ "z", "" }])

      xyz.parse("xyz").results.should eq([{ "x", "yz" }])
      xyz.parse("yyz").results.should eq([{ "y", "yz" }])
      xyz.parse("zyz").results.should eq([{ "z", "yz" }])
    end

    it "returns a failure if the string doesn't start with one of the chars" do
      xyz.parse("abc").failure?.should be_true
    end
  end
end
