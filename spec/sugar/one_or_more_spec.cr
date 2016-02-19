require "../spec_helper"

include Comb

describe Parser do
  x     = +Base::Char.new('x')
  y     = +Base::Char.new('y')
  empty = +Base::Empty.new
  none  = +Base::None.new

  describe "#+ return value" do
    describe "#matches?" do
      it "returns true iff the string can be split into substrings that each are matched by the parser" do
        x.matches?("xxxx").should be_true
        y.matches?("xxxx").should be_false
        none.matches?("xxxx").should be_false

        x.matches?("x").should be_true
        y.matches?("x").should be_false
        none.matches?("x").should be_false

        x.matches?("").should be_false
        y.matches?("").should be_false
        none.matches?("").should be_false
      end
    end

    describe "#parse" do
      it "returns the set of matches for the parser as well as the empty string match" do
        x.parse("xxxx").results.should eq([{ "xxxx", "" }, { "xxx", "x" }, { "xx", "xx" }, { "x", "xxx" }])
        y.parse("xxxx").results.should eq([] of { String, String })
        none.parse("xxxx").results.should eq([] of { String, String })

        x.parse("x").results.should eq([{ "x", "" }])
        y.parse("x").results.should eq([] of { String, String })
        none.parse("x").results.should eq([] of { String, String })

        x.parse("").results.should eq([] of { String, String })
        y.parse("").results.should eq([] of { String, String })
        none.parse("").results.should eq([] of { String, String })
      end
    end
  end
end
