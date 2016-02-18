require "../spec_helper"

include Comb

describe Lib::Word do
  w = Lib::Word.new

  describe "#matches?" do
    it "returns true for single alphabetic chars" do
      w.matches?("a").should be_true
      w.matches?("m").should be_true
      w.matches?("x").should be_true
    end

    it "returns true for multiple alphabetic chars" do
      w.matches?("abc").should be_true
      w.matches?("mno").should be_true
      w.matches?("xyz").should be_true
    end

    it "returns false for single non-alphabetic chars" do
      w.matches?("0").should be_false
      w.matches?(" ").should be_false
      w.matches?("&").should be_false
    end

    it "returns false for longer strings with non-alphabetic chars" do
      w.matches?("abc0").should be_false
      w.matches?("a b").should be_false
    end

    it "returns false for the empty string" do
      w.matches?("").should be_false
    end
  end

  describe "#parse" do
    it "returns the result for single alphabetic chars" do
      w.parse("a").results.should eq([{ "a", "" }])
      w.parse("m").results.should eq([{ "m", "" }])
      w.parse("x").results.should eq([{ "x", "" }])
    end

    it "returns the results for for multiple alphabetic chars" do
      w.parse("abc").results.should eq([{ "abc", "" }, { "ab", "c" }, { "a", "bc" }])
      w.parse("mno").results.should eq([{ "mno", "" }, { "mn", "o" }, { "m", "no" }])
      w.parse("xyz").results.should eq([{ "xyz", "" }, { "xy", "z" }, { "x", "yz" }])
    end

    it "fails for single non-alphabetic chars" do
      w.parse("0").failure?.should be_true
      w.parse(" ").failure?.should be_true
      w.parse("&").failure?.should be_true
    end

    it "parses initial alphabetic chars for strings with mixed chars" do
      w.parse("abc0").results.should eq([{ "abc", "0" }, { "ab", "c0" }, { "a", "bc0" }])
      w.parse("a b").results.should eq([{ "a", " b"}])
    end

    it "returns false for the empty string" do
      w.parse("").failure?.should be_true
    end
  end
end
