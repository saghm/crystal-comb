require "./sequence"
require "../parser"

module Comb
  module Combinators
    struct ZeroOrMore < Parser
      property parser

      def inititalize(@parser)
      end

      def matches?(s)
        return Result.new([{ "", "" }]) if s.empty?

        Sequence.new(@parser, self).parse(s)
      end
    end
  end
end
