require "../parser"

module Comb
  module Combinators
    class ZeroOrMore < Parser
      def initialize(@parser : Parser)
      end

      def matches?(s : String)
        return true if s.empty?

        Sequence.new(@parser, self).matches?(s)
      end

      def parse(s : String)
        return Result.new([{ "", "" }]) if s.empty?

        results = Sequence.new(@parser, self).parse(s).results
        results << { "", s }
        Result.new(results)
      end
    end
  end
end
