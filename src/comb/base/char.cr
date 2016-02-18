require "../parser"
require "../result"

module Comb
  module Base
    class Char < Parser
      def initialize(@v)
      end

      def matches?(s : String)
        s.size == 1 && s[0] == @v
      end

      def parse(s : String)
        vals = [] of {String, String}
        vals << { s[0..0], s[1..-1] } unless s.empty? || s[0] != @v

        Result.new(vals)
      end
    end
  end
end
