require "../parser"

module Comb
  module Combinators
    class OneOrMore < Parser
      def initialize(parser : Parser)
        @sequence = Sequence.new(parser, ZeroOrMore.new(parser))
      end

      def matches?(s : String)
        @sequence.matches?(s)
      end

      def parse(s : String)
        @sequence.parse(s)
      end
    end
  end
end
