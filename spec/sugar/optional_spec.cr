require "../spec_helper"

include Comb

describe Parser do
  x     = ~Base::Char.new('x')
  y     = ~Base::Char.new('y')
  empty = ~Base::Empty.new
  none  = ~Base::None.new

  describe "#~ return value" do
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
end
