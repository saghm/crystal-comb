require "./optional"
require "./sequence"
require "./zero_or_more"
require "../parser"

module Comb
  module Combinators
    struct OneOrMore < Parser
      property sequence

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
