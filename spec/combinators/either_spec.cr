require "../spec_helper"

include Comb

describe Combinators::Either do
  x          = Base::Char.new('x')
  y          = Base::Char.new('y')
  empty      = Base::Empty.new
  none       = Base::None.new
  x_or_y     = Combinators::Either.new(x, y)
  x_or_empty = Combinators::Either.new(x, empty)
  x_or_none  = Combinators::Either.new(x, none)

  describe "#matches?" do
    it "returns true iff either of the parsers match the string" do
      x_or_y.matches?("x").should be_true
      x_or_empty.matches?("x").should be_true
      x_or_none.matches?("x").should be_true

      x_or_y.matches?("y").should be_true
      x_or_empty.matches?("y").should be_false
      x_or_none.matches?("y").should be_false
    end
  end

  describe "#parse" do
    it "returns the combined set of matches for both parsers" do
      x_or_y.parse("x").results.should eq([{ "x", "" }])
      x_or_empty.parse("x").results.should eq([{ "x", "" }, { "", "x" }])
      x_or_none.parse("x").results.should eq([{ "x", "" }])

      x_or_y.parse("y").results.should eq([{ "y", "" }])
      x_or_empty.parse("y").results.should eq([{ "", "y" }])
      x_or_none.parse("y").results.should eq([] of { String, String })
    end
  end
end
