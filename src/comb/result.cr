module Comb
  struct Result
    include Enumerable({String, String})
    property results

    def initialize(results : Array({String, String}))
      @results = results.uniq
    end

    def success?
      !failure?
    end

    def failure?
      @results.empty?
    end

    def each
      @results.each { |r| yield r }
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

    def +(other)
      Result.new(@results + other.results)
    end
  end
end
