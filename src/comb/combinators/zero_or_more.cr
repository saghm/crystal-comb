require "./sequence"
require "../parser"

module Comb
  module Combinators
    struct ZeroOrMore < Parser
      property parser

      def initialize(@parser : Parser)
      end

      def matches?(s)
        return true if s.empty?

        Sequence.new(@parser, self).matches?(s)
      end

      def parse(s)
        return Result.new([{ "", "" }]) if s.empty?

        results = Sequence.new(@parser, self).parse(s).results
        results << { "", s }
        Result.new(results)
      end
    end
  end
end
