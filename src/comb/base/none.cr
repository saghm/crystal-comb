module Comb
  module Base
    struct None
      def matches?(s)
        false
      end

      def parse
        Result.new([] of {String, String})
      end
    end
  end
end
