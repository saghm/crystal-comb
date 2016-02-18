require "./either"
require "../base/empty"

module Comb
  module Combinators
    class Optional < Parser
      def initialize(parser : Parser)
        @either = Either.new(parser, Base::Empty.new)
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
