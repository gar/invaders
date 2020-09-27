require_relative './sub_pattern_generator'
require_relative './detection_result'

module Invaders
  class Detector
    def initialize(radar_sample_pattern, known_invader_patterns: [])
      @radar_sample_pattern = radar_sample_pattern
      @known_invader_patterns = known_invader_patterns
    end

    def detect
      @known_invader_patterns.flat_map do |invader|
        subpatterns = Invaders::SubPatternGenerator.new(@radar_sample_pattern)
                                                   .subpatterns(height: invader.height, width: invader.width)
        subpatterns.map { |subpat| Invaders::DetectionResult.new(invader, subpat) }
      end
    end
  end
end
