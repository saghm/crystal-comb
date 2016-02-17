require "./spec_helper"

include Comb

describe Combinators do
  # describe "#or?" do
  #   x     = Base::Char.new('x')
  #   y     = Base::Char.new('y')
  #   empty = Base::Empty.new
  #   none  = Base::None.new
  #
  #   it "returns true iff either self or the first argument #matches? the string" do
  #     x.or?(y, "x").should eq(x.matches?("x") || y.matches?("x"))
  #     x.or?(empty, "x").should eq(x.matches?("x") || empty.matches?("x"))
  #     x.or?(none, "x").should eq(x.matches?("x") || none.matches?("x"))
  #     y.or?(empty, "x").should eq(y.matches?("x") || empty.matches?("x"))
  #     y.or?(none, "x").should eq(y.matches?("x") || none.matches?("x"))
  #   end
  # end
  #
  # describe "#or" do
  #   x     = Base::Char.new('x')
  #   y     = Base::Char.new('y')
  #   empty = Base::Empty.new
  #   none  = Base::None.new
  #
  #   it "returns the combined results of self and the argument #parse-ing the string" do
  #   end
  # end
end
