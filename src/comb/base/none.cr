module Comb
  module Base
    struct None
      def matches?(s : String)
        false
      end

      def parse(s : String)
        Result.new([] of {String, String})
      end
    end
  end
end
