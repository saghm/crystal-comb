require "../parser"

module Comb
  module Combinators
    struct Either < Parser
      property a
      property b

      def initialize(@a, @b)
      end

      def matches?(s : String)
        @a.matches?(s) || @b.matches?(s)
      end

      def parse?(s : String)
        @a.parse?(s) + @b.parse(s)
      end
    end
  end
end
