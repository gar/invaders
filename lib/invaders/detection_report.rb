module Invaders
  class DetectionReport
    def initialize(results, min_confidence: 0.8, out: STDOUT)
      @results = results
      @min_confidence = min_confidence
      @out = out
    end

    def print_report
      likely_positive_results.each do |res|
        @out.puts "Possible invader detected at #{res.coordinates.inspect}! (Confidence #{res.confidence.round(2)})"
      end
    end

    private

    def likely_positive_results
      @results.select { |res| res.confidence >= @min_confidence }
    end
  end
end
