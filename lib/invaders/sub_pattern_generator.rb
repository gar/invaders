module Invaders
  class SubPatternGenerator
    def initialize(pattern)
      @pattern = pattern
    end

    def subpatterns(height:, width:)
      matrix = @pattern.matrix
      consecutive_rows_groups = matrix.each_cons(height).to_a
      consecutive_rows_groups.flat_map do |rows|
        0.upto(@pattern.width - width).map do |i|
          submatrix = rows.map { |row| row.drop(i).take(width) }
          subpat = submatrix.map(&:join).join("\n")
          Invaders::ReflectionPattern.new(subpat)
        end
      end
    end
  end
end
