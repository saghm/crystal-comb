require "../result"

module Comb
  module Base
    struct Empty
      def matches?(s)
        s.empty?
      end

      def parse(s)
        Result.new([{ "", s }])
      end
    end
  end
end
