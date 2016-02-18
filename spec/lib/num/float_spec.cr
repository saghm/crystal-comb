require "../../spec_helper"

include Comb

describe Lib::Num::Float do
  f = Lib::Num::Float.new

  describe "#matches?" do
    it "returns true for any digit" do
      f.matches?("0").should be_true
      f.matches?("2").should be_true
      f.matches?("7").should be_true
    end

    it "returns true for any string of digits" do
      f.matches?("01123232132").should be_true
    end

    it "returns true for a hyphen followed by any string of digits" do
      f.matches?("-01123232132").should be_true
    end

    it "returns false for any other initial characters" do
      f.matches?("a").should be_false
      f.matches?("b").should be_false
    end

    it "returns false for a hyphen followed by a non-digit" do
      f.matches?("-a01123232132").should be_false
    end

    it "returns false for multiple hyphens followed by any string of digits" do
      f.matches?("--01123232132").should be_false
    end

    it "returns false for digits followed by a period" do
      f.matches?("01123232132.").should be_false
    end

    it "returns true for digits followed by a period and more digits" do
      f.matches?("0.0").should be_true
      f.matches?("0.011").should be_true
      f.matches?("011.0").should be_true
      f.matches?("011.011").should be_true
    end

    it "returns true for a hyphen digits followed by a period and more digits" do
      f.matches?("-0.0").should be_true
      f.matches?("-0.011").should be_true
      f.matches?("-011.0").should be_true
      f.matches?("-011.011").should be_true
    end

    it "returns false for the empty string" do
      f.matches?("").should be_false
    end
  end

  describe "#parse" do
    it "returns the result for initial digits" do
      f.parse("0").results.should eq([{ "0", "" }])
      f.parse("2a").results.should eq([{ "2", "a" }])
      f.parse("777bb").results.should eq([{ "777", "bb" }, { "77", "7bb" }, { "7" , "77bb"}])
    end

    it "returns the result for initial digits followed by a period and more digits" do
      f.parse("0.11").results.should eq([{ "0.11", "" }, { "0.1", "1" }, { "0", ".11" }])
      f.parse("98.0a").results.should eq([{ "98.0", "a" }, { "98", ".0a" }, { "9", "8.0a"}])
      f.parse("1.22a").results.should eq([{ "1.22", "a" }, { "1.2", "2a"}, { "1", ".22a" }])
    end

    it "returns the result for initial hyphen followed by digits" do
      f.parse("-0.11").results.should eq([{ "-0.11", "" }, { "-0.1", "1" }, { "-0", ".11" }])
      f.parse("-98.0a").results.should eq([{ "-98.0", "a" }, { "-98", ".0a" }, { "-9", "8.0a"}])
      f.parse("-1.22a").results.should eq([{ "-1.22", "a" }, { "-1.2", "2a"}, { "-1", ".22a" }])
    end

    it "returns the result for initial hyphen followed by digits followed by a period and more digits" do
      f.parse("-0.11").results.should eq([{ "-0.11", "" }, { "-0.1", "1" }, { "-0", ".11" }])
      f.parse("-98.0a").results.should eq([{ "-98.0", "a" }, { "-98", ".0a" }, { "-9", "8.0a" }])
      f.parse("-1.22a").results.should eq([{ "-1.22", "a" }, { "-1.2", "2a"}, { "-1", ".22a" }])
    end

    it "should fail for a hyphen followed by a non-digit" do
      f.parse("-a01123232132").failure?.should be_true
    end

    it "should fail for multiple hyphens followed by any string of digits" do
      f.parse("--01123232132").failure?.should be_true
    end

    it "should fail for digits followed by a period" do
      f.parse("01123232132.").failure?.should be_false
    end

    it "returns a failure if the string doesn't start with a digit or hyphen" do
      f.parse("a").failure?.should be_true
      f.parse(" a12").failure?.should be_true
    end
  end
end
