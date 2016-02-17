require "../spec_helper"

include Comb

describe Combinators::ZeroOrMore do
  x          = Combinators::ZeroOrMore.new(Base::Char.new('x'))
  y          = Combinators::ZeroOrMore.new(Base::Char.new('y'))
  none       = Combinators::ZeroOrMore.new(Base::None.new)


  describe "#matches?" do
    it "returns true iff the string is empty or can be split into substrings that each are matched by the parser" do
      x.matches?("xxxx").should eq(true)
      y.matches?("xxxx").should eq(false)
      none.matches?("xxxx").should eq(false)

      x.matches?("x").should eq(true)
      y.matches?("x").should eq(false)
      none.matches?("x").should eq(false)

      x.matches?("").should eq(true)
      y.matches?("").should eq(true)
      none.matches?("").should eq(true)
    end
  end

  describe "#parse" do
    it "returns the set of matches for the parser as well as the empty string match" do
      x.parse("xxxx").results.should eq([{ "xxxx", "" }, { "xxx", "x" }, { "xx", "xx" }, { "x", "xxx" }, { "", "xxxx" }])
      y.parse("xxxx").results.should eq([{ "", "xxxx" }])
      none.parse("xxxx").results.should eq([{ "", "xxxx" }])

      x.parse("x").results.should eq([{ "x", "" }, { "", "x" }])
      y.parse("x").results.should eq([{ "", "x" }])
      none.parse("x").results.should eq([{ "", "x" }])

      x.parse("").results.should eq([{ "", "" }])
      y.parse("").results.should eq([{ "", "" }])
      none.parse("").results.should eq([{ "", "" }])
    end
  end
end
