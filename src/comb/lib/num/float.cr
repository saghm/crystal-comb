require "../../parser"

module Comb
  module Lib
    module Num
      class Float < Parser
        def initialize
          @parser = Combinators::Sequence.new(Int.new, Combinators::Optional.new(
                    Combinators::Sequence.new(Base::Char.new('.'),
                    Combinators::OneOrMore.new(Digit.new))))
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
