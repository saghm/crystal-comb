require "./base/char"
require "./base/empty"
require "./base/none"

module Comb
  module Combinators
    def or?(p, s)
      self.matches?(s) || p.matches?(s)
    end

    def or(p, s)
      Result.new(self.parse(s).results + p.parse(s).results)
    end

    def and?(p, s)
      self.parse(s).any? { |result| p.match?(result[1]) }
    end

    def and(p, s)
      results = self.parse(s).flat_map do |result|
        match, rest = result

        p.parse(rest).map { |r| { match + r[0], r[1] } }
      end

      Result.new(results)
    end

    def optional
      self.and(Base::Empty)
    end
  end
  
  module Base
    struct Char
      include Combinators
    end

    struct Empty
      include Combinators
    end

    struct None
      include Combinators
    end
  end
end
