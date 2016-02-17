module Comb
  struct Result
    include Enumerable({String, String})
    property results

    def initialize(@results)
    end

    def success?
      @result
    end

    def failure?
      !success?
    end

    def each(&block)
      @results.each &block
    end

    def parsed_values
      @results.map(&.first)
    end

    def results
      @results.dup
    end
  end
end
