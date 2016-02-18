require "../../parser"

module Comb
  module Lib
    module Num
      class Int < Parser
        def initialize
          @parser = Combinators::Sequence.new(
                      Combinators::Optional.new(Base::Char.new('-')),
                      Combinators::OneOrMore.new(Num::Digit.new))
        end

        def matches?(s : String)
          @parser.matches?(s)
        end

        def parse(s : String)
          @parser.parse(s)
        end
      end
    end
  end
end
