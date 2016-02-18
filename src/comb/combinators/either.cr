require "../parser"

module Comb
  module Combinators
    class Either < Parser
      def initialize(@a : Parser, @b : Parser)
      end

      def matches?(s : String)
        @a.matches?(s) || @b.matches?(s)
      end

      def parse(s : String)
        @a.parse(s) + @b.parse(s)
      end
    end
  end
end
