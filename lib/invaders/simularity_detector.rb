module Invaders
  class SimularityDetector
    def initialize(pattern_a, pattern_b)
      if pattern_a.height != pattern_b.height || pattern_a.width != pattern_b.width
        raise IncomparableError.new "Patterns must be of same dimensions, got #{pattern_a.height}x#{pattern_a.width} and {pattern_b.height}x#{pattern_b.width}."
      end
      @pattern_a = pattern_a
      @pattern_b = pattern_b
    end

    def simularity
      simularities = @pattern_a.matrix.zip(@pattern_b.matrix).map do |row_a, row_b|
        row_a.zip(row_b).count { |a, b| a == b }
      end.sum

      simularities.to_f / @pattern_a.area
    end

    class IncomparableError < ArgumentError; end
  end
end
