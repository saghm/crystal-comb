require "../parser"

module Comb
  module Combinators
    struct Sequence < Parser
      property first
      property second

      def initialize(@first, @second)
      end

      def matches?(s : String)
        first.parse(s).any? { |result| @second.matches?(result) }
      end

      def parse(s : String)
        results = first.parse(s).flat_map do |result|
          match, rest = result

          second.parse(rest).map { |r| { match + r[0], r1 } }
        end

        Results.new(results)
      end
    end
  end
end
