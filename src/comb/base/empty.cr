require "../parser"
require "../result"

module Comb
  module Base
    struct Empty < Parser
      def matches?(s : String)
        s.empty?
      end

      def parse(s : String)
        Result.new([{ "", s }])
      end
    end
  end
end
