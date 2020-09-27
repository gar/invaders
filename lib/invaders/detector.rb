require_relative './iterative_sub_pattern_generator'
require_relative './detection_result'

module Invaders
  class Detector
    def initialize(radar_sample_pattern,
                   known_invader_patterns: [],
                   subpattern_generator_class: Invaders::IterativeSubPatternGenerator)
      @radar_sample_pattern = radar_sample_pattern
      @known_invader_patterns = known_invader_patterns
      @sub_pattern_generator_class = subpattern_generator_class
    end

    def detect
      @known_invader_patterns.flat_map do |invader|
        subpatterns(invader.height, invader.width).map do
          |subpat| Invaders::DetectionResult.new(invader, subpat)
        end
      end
    end

    private

    def subpatterns(height, width)
      @sub_pattern_generator_class.new(@radar_sample_pattern).subpatterns(height: height, width: width)
    end
  end
end
