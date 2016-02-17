require "../spec_helper"

include Comb

describe Combinators::Sequence do
  x          = Base::Char.new('x')
  y          = Base::Char.new('y')
  empty      = Base::Empty.new
  none       = Base::None.new
  x_then_y     = Combinators::Sequence.new(x, y)
  x_then_empty = Combinators::Sequence.new(x, empty)
  x_then_none  = Combinators::Sequence.new(x, none)

  describe "#matches?" do
    it "returns true iff the string can be split in two where each substring matches each parser" do
      x_then_y.matches?("x").should eq(false)
      x_then_empty.matches?("x").should eq(true)
      x_then_none.matches?("x").should eq(false)

      x_then_y.matches?("xy").should eq(true)
      x_then_empty.matches?("xy").should eq(false)
      x_then_none.matches?("xy").should eq(false)
    end
  end

  describe "#parse" do
    it "combines the matches from the first parser with the results of running the second on the leftovers" do
      x_then_y.parse("x").results.should eq([] of { String, String })
      x_then_empty.parse("x").results.should eq([{ "x", "" }])
      x_then_none.parse("x").results.should eq([] of { String, String })

      x_then_y.parse("xy").results.should eq([{ "xy", "" }])
      x_then_empty.parse("xy").results.should eq([{ "x", "y" }])
      x_then_none.parse("xy").results.should eq([] of { String, String })
    end
  end
end
