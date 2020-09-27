module Invaders
  class ReflectionPattern
    attr_reader :height, :width

    def initialize(pattern_string)
      lines = pattern_string.split("\n")
      @height = lines.size
      @width = lines.first.size
    end
  end
end
