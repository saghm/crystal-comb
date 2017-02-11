require "../parser"

module Comb
  module Combinators
    class Sequence < Parser
      def initialize(@first : Parser, @second : Parser)
      end

      def matches?(s : String)
        @first.parse(s).any? { |result| @second.matches?(result[1]) }
      end

      def parse(s : String)
        results = @first.parse(s).flat_map do |result|
          match, rest = result

          @second.parse(rest).map { |r| { match + r[0], r[1] } }.as Array({ String, String })
        end

        Result.new(results)
      end
    end
  end
end
