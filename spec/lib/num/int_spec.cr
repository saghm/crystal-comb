require "../../spec_helper"

include Comb

describe Lib::Num::Int do
  i = Lib::Num::Int.new

  describe "#matches?" do
    it "returns true for any digit" do
      i.matches?("0").should be_true
      i.matches?("2").should be_true
      i.matches?("7").should be_true
    end

    it "returns false for any other characters" do
      i.matches?("a").should be_false
      i.matches?("b").should be_false
    end

    it "returns true for any string of digits" do
      i.matches?("01123232132").should be_true
    end

    it "returns true for a hyphen followed by any string of digits" do
      i.matches?("-01123232132").should be_true
    end

    it "returns false for multiple hyphens followed by any string of digits" do
      i.matches?("--01123232132").should be_false
    end

    it "returns false for the empty string" do
      i.matches?("").should be_false
    end
  end

  describe "#parse" do
    it "returns the result for initial digits" do
      i.parse("0").results.should eq([{ "0", "" }])
      i.parse("2a").results.should eq([{ "2", "a" }])
      i.parse("777bb").results.should eq([{ "777", "bb" }, { "77", "7bb" }, { "7" , "77bb"}])
    end

    it "returns the result for initial hyphen followed by digits" do
      i.parse("-0").results.should eq([{ "-0", "" }])
      i.parse("-98").results.should eq([{ "-98", "" }, { "-9", "8" }])
      i.parse("-122a").results.should eq([{ "-122", "a" }, { "-12", "2a"}, { "-1", "22a" }])
    end

    it "returns a failure if the string doesn't start with a digit or hyphen" do
      i.parse("a").failure?.should be_true
      i.parse(" a12").failure?.should be_true
    end
  end
end
