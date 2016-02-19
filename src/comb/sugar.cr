require "./parser"

module Comb
  class Parser
    def >>(p : Parser)
      Combinators::Sequence.new(self, p)
    end

    def <=>(p : Parser)
      Combinators::Either.new(self, p)
    end

    def <<(p : Parser)
      Combinators::Sequence.new(p, self)
    end

    def +
      Combinators::OneOrMore.new(self)
    end

    def -
      Combinators::ZeroOrMore.new(self)
    end

    def ~
      Combinators::Optional.new(self)
    end
  end
end
