require "./either"
require "../base/empty"

module Comb
  module Combinators
    struct Optional < Parser
      property either

      def initialize(parser : Parser)
        @either = Either.new(parser, Empty.new)
      end

      def matches?(s)
        @either.matches?(s)
      end

      def parse(s)
        @either.parse(s)
      end
    end
  end
end
