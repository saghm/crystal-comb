require "../chars"
require "../../parser"

module Comb
  module Lib
    module Num
      class Digit < Parser
        def initialize
          @parser = Chars.new("0123456789")
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
