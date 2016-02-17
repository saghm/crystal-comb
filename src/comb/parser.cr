require "./result"

module Comb
  abstract struct Parser
    def matches?(s : String)
      false
    end

    def parse(s : String)
      Result.new([] of {String, String})
    end
  end
end
