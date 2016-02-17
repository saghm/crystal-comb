require "../spec_helper"

include Comb

describe Base::Char do
  c = Base::Char.new('x')

  describe "#matches?" do
    it "is true for the same character it's initialized with" do
      c.matches?("x").should be_true
    end

    it "is false for characters other than the one it's initialized with" do
      c.matches?("y").should be_false
    end

    it "is false for strings with more than one character" do
      c.matches?("xy").should be_false
      c.matches?("yx").should be_false
    end
  end

  describe "#parse" do
    it "returns a success for the character it's initialized with" do
      c.parse("x").success?.should be_true
    end

    it "returns one result for the character it's initialized with" do
      c.parse("x").size.should eq(1)
    end

    it "returns a result with the same character for the character it's initialized with" do
      c.parse("x").results[0][0].should eq("x")
    end

    it "returns a result with nothing after it for the character it's initialized with" do
      c.parse("x").results[0][1].should eq("")
    end

    it "returns a success for a string beginning with character it's initialized with" do
      c.parse("xy").success?.should be_true
    end

    it "returns one result for a string beginning with the character it's initialized with" do
      c.parse("xy").size.should eq(1)
    end

    it "returns a result with the same character for a string beginning with the character it's initialized with" do
      c.parse("xy").results[0][0].should eq("x")
    end

    it "returns a result with the rest of the string for the character it's initialized with" do
      c.parse("xy").results[0][1].should eq("y")
    end

    it "returns a failure for characters other than the one it's inialized with" do
      c.parse("y").failure?.should be_true
    end
  end
end
