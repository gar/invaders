require_relative '../../lib/invaders/simularity_detector'
require_relative '../../lib/invaders/reflection_pattern'

RSpec.describe Invaders::SimularityDetector do
  let(:tiny_ufo) { Invaders::ReflectionPattern.new('o') }

  it 'reports simularity as 0.0 if patterns do not match' do
    clear_space = Invaders::ReflectionPattern.new('-')

    simularity = Invaders::SimularityDetector.new(tiny_ufo, clear_space).simularity

    expect(simularity).to eq(0.0)
  end

  it 'reports simularity as 1.0 if patterns fully match' do
    danger_space = Invaders::ReflectionPattern.new('o')

    simularity = Invaders::SimularityDetector.new(tiny_ufo, danger_space).simularity

    expect(simularity).to eq(1.0)
  end

  it 'reports simularity as 0.5 if patterns half match' do
    larger_ufo = Invaders::ReflectionPattern.new('oo')
    a_bit_of_danger = Invaders::ReflectionPattern.new('-o')

    simularity = Invaders::SimularityDetector.new(larger_ufo, a_bit_of_danger).simularity

    expect(simularity).to eq(0.5)
  end

  it 'raises an error if patterns are not comparable' do
    long_space = Invaders::ReflectionPattern.new('----')

    expect {
      Invaders::SimularityDetector.new(tiny_ufo, long_space)
    }.to raise_error(Invaders::SimularityDetector::IncomparableError)
  end
end
