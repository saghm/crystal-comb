require "../spec_helper"

include Comb

describe Base::Empty do
  c = Base::Empty.new

  describe "#matches?" do
    it "is true for empty string" do
      c.matches?("").should be_true
    end

    it "is false any non-empty string" do
      c.matches?("y").should be_false
      c.matches?("hello").should be_false
    end
  end

  describe "#parse" do
    it "returns a success for any string" do
      c.parse("").success?.should be_true
      c.parse("y").success?.should be_true
      c.parse("hello").success?.should be_true
    end

    it "returns one result for any string" do
      c.parse("").size.should eq(1)
      c.parse("y").size.should eq(1)
      c.parse("hello").size.should eq(1)
    end

    it "returns a result with the empty string for any string" do
      c.parse("").results[0][0].should eq("")
      c.parse("y").results[0][0].should eq("")
      c.parse("hello").results[0][0].should eq("")
    end

    it "returns a result with the rest being the same string for any string" do
      c.parse("").results[0][1].should eq("")
      c.parse("y").results[0][1].should eq("y")
      c.parse("hello").results[0][1].should eq("hello")
    end
  end
end
