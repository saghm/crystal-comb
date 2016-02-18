require "../parser"

module Comb
  module Base
    class Empty < Parser
      def matches?(s : String)
        s.empty?
      end

      def parse(s : String)
        Result.new([{ "", s }])
      end
    end
  end
end
