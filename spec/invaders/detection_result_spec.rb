require_relative '../../lib/invaders/detection_result'
require_relative '../../lib/invaders/reflection_pattern'

RSpec.describe Invaders::DetectionResult do
  let(:invader) { Invaders::ReflectionPattern.new('o') }

  it 'reports a confidence of 0.0 if not matched' do
    radar_sample = Invaders::ReflectionPattern.new('-')
    result = Invaders::DetectionResult.new(invader, radar_sample)

    expect(result.confidence).to eq(0.0)
  end

  it 'reports a confidence of 1.0 if pattern matches' do
    radar_sample = Invaders::ReflectionPattern.new('o')
    result = Invaders::DetectionResult.new(invader, radar_sample)

    expect(result.confidence).to eq(1.0)
  end

  it 'reports the coordinates of the radar pattern' do
    radar_sample = double('radar pattern', coordinates: [[0, 1], [1, 1]])

    result = Invaders::DetectionResult.new(invader, radar_sample)

    expect(result.coordinates).to eq([[0, 1], [1, 1]])
  end
end
