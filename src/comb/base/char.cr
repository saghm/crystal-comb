require "../result"

module Comb
  module Base
    struct Char
      property v

      def initialize(@v)
      end

      def matches?(s)
        s.size == 1 && s[0] == @v
      end

      def parse(s)
        vals = matches?(s) ? [{ s[0..0], s[1..-1] }] : [] of {String, String}

        Result.new(vals)
      end
    end
  end
end
