require_relative './reflection_pattern'
require_relative './detector'
require_relative './detection_report'

module Invaders
  class CLI
    def initialize(radar_sample_filename, *known_invader_filenames)
      @radar_sample_filename = radar_sample_filename
      @known_invader_filenames = known_invader_filenames
    end

    def run
      radar_sample_pattern = Invaders::ReflectionPattern.new(File.read(@radar_sample_filename))
      known_invader_patterns = @known_invader_filenames.map do |filename|
        Invaders::ReflectionPattern.new(File.read(filename))
      end
      results = Invaders::Detector.new(radar_sample_pattern, known_invader_patterns: known_invader_patterns)
      Invaders::DetectionReport.new(results).print_report
    end
  end
end
