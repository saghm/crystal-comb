require "../parser"
require "../result"

module Comb
  module Base
    struct Char < Parser
      property v

      def initialize(@v)
      end

      def matches?(s : String)
        s.size == 1 && s[0] == @v
      end

      def parse(s : String)
        vals = [] of {String, String}
        vals.push({ s[0..0], s[1..-1] }) unless s.empty? || s[0] != @v

        Result.new(vals)
      end
    end
  end
end
