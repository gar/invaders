module Invaders
  class ReflectionPattern
    attr_reader :matrix, :coordinates

    def initialize(pattern_string, coordinates=nil)
      @matrix = pattern_string.split("\n").map(&:chars)
      @coordinates = coordinates
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
