module Invaders
  class IterativeSubPatternGenerator
    def initialize(pattern)
      @pattern = pattern
    end

    def subpatterns(height:, width:)
      0.upto(@pattern.height - height).flat_map do |i|
        rows = @pattern.matrix.drop(i).take(height)
        0.upto(@pattern.width - width).map do |j|
          submatrix = rows.map { |row| row.drop(j).take(width) }
          subpat = submatrix.map(&:join).join("\n")
          Invaders::ReflectionPattern.new(subpat, [[i, j], [i+height-1, j+width-1]])
        end
      end
    end
  end
end
