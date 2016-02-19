require "../spec_helper"

include Comb

describe Combinators::Optional do
  x     = Combinators::Optional.new(Base::Char.new('x'))
  y     = Combinators::Optional.new(Base::Char.new('y'))
  empty = Combinators::Optional.new(Base::Empty.new)
  none  = Combinators::Optional.new(Base::None.new)

  describe "#matches?" do
    it "returns true iff the string matches the parser or the string is empty" do
      x.matches?("x").should be_true
      y.matches?("x").should be_false
      empty.matches?("x").should be_false
      none.matches?("x").should be_false

      x.matches?("").should be_true
      y.matches?("").should be_true
      empty.matches?("").should be_true
      none.matches?("").should be_true
    end
  end

  describe "#parse" do
    it "returns the set of matches for the parser as well as the empty string match" do
      x.parse("x").results.should eq([{ "x", "" }, { "", "x" }])
      y.parse("x").results.should eq([{ "", "x" }])
      empty.parse("x").results.should eq([{ "", "x" }])
      none.parse("x").results.should eq([{ "", "x" }])
    end
  end
end
