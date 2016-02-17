module Comb
  struct Result
    include Enumerable({String, String})
    property results

    def initialize(@results : Array({String, String}))
    end

    def success?
      !failure?
    end

    def failure?
      @results.empty?
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

    def size
      @results.size
    end
  end
end
