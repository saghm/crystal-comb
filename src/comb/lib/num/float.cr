require "./digit"
require "../../combinators/one_or_more"
require "../../combinators/optional"
require "../../combinators/sequence"
require "../../parser"

module Comb
  module Lib
    module Num
      class Digit < Parser
        def initialize
          @parser = Sequence.new(Optional.new(Char.new('-'), OneOrMore.new(Digit.new)))
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
