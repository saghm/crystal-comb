require "../parser"

module Comb
  module Lib
    class Word < Parser
      def initialize
        @parser = Combinators::OneOrMore.new(Chars.new("abcdefghijklmnopqrstuvwxyz"))
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
