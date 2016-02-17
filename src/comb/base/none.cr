module Comb
  module Base
    struct None
      def matches?(s)
        false
      end

      def parse
        Result.new([] of Tuple(String, String))
      end
    end
  end
end
