require_relative '../../lib/invaders/detector'
require_relative '../../lib/invaders/reflection_pattern'

RSpec.describe Invaders::Detector do
  describe '#detect' do
      let(:tiny_radar) { Invaders::ReflectionPattern.new(<<~TINY
                                                           --
                                                           o-
                                                         TINY
                                                        )
      }
      let(:tiny_ufo) { Invaders::ReflectionPattern.new("o") }
      let(:results) { Invaders::Detector.new(tiny_radar, known_invader_patterns: [tiny_ufo]).detect }


    it 'reports one result for each subsample big enough to contain a known invader' do
      expect(results.size).to eq(4)
    end

    it 'has one result that contains the ufo' do
      positive_results = results.count { |r| r.confidence == 1.0 }
    end

    it 'the positive result reveals the coordinates of the ufo' do
      positive_result = results.find { |r| r.confidence == 1.0 }
      expect(positive_result.coordinates).to eq([[1, 0], [1,0]])
    end
  end
end
