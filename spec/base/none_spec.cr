require "../spec_helper"

include Comb

describe Base::None do
  c = Base::None.new

  describe "#matches?" do
    it "is false any string" do
      c.matches?("").should be_false
      c.matches?("y").should be_false
      c.matches?("hello").should be_false
    end
  end

  describe "#parse" do
    it "returns a failure for any string" do
      c.parse("").failure?.should be_true
      c.parse("y").failure?.should be_true
      c.parse("hello").failure?.should be_true
    end
  end
end
