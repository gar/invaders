module Invaders
  class ReflectionPattern
    attr_reader :matrix

    def initialize(pattern_string)
      @matrix = pattern_string.split("\n").map(&:chars)
    end

    def height
      @matrix.length
    end
    
    def width
      @matrix.first.length
    end

    def area
      height * width
    end
  end
end
