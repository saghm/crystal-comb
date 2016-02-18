require "../base/char"
require "../base/none"
require "../combinators/either"
require "../parser"

module Comb
  module Lib
    class Chars < Parser
      def initialize(chars : String)
        @parser = case chars.size
        when 0
          Base::None.new
        when 1
          Base::Char.new(chars[0])
        else
          Combinators::Either.new(Base::Char.new(chars[0]), Chars.new(chars[1..-1]))
        end
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
