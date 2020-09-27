require_relative './simularity_detector'

module Invaders
  class DetectionResult
    def initialize(invader_pattern, radar_pattern)
      @invader_pattern = invader_pattern
      @radar_pattern = radar_pattern
    end

    def confidence
      Invaders::SimularityDetector.new(@invader_pattern, @radar_pattern).simularity
    end

    def coordinates
      @radar_pattern.coordinates
    end
  end
end
