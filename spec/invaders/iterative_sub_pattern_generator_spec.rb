require_relative '../../lib/invaders/iterative_sub_pattern_generator'
require_relative '../../lib/invaders/reflection_pattern'

RSpec.describe Invaders::IterativeSubPatternGenerator do
  let(:tiny_radar) {
    Invaders::ReflectionPattern.new(<<~RADAR
                                      --
                                      o-
                                    RADAR
                                   )
  }

  it 'generates four 1x1 subpatterns for a pattern of 2x2' do
    subpatterns = Invaders::IterativeSubPatternGenerator.new(tiny_radar).subpatterns(height: 1, width: 1)
    expect(subpatterns.count).to eq(4)
    subpatterns.each { |subpat| expect(subpat.height).to eq(1) }
    subpatterns.each { |subpat| expect(subpat.width).to eq(1) }
  end

  it 'generates one 2x2 subpatterns for a pattern of 2x2' do
    subpatterns = Invaders::IterativeSubPatternGenerator.new(tiny_radar).subpatterns(height: 2, width: 2)
    expect(subpatterns.count).to eq(1)
    subpat = subpatterns.first
    expect(subpat.height).to eq(2)
    expect(subpat.width).to eq(2)
  end

  it 'generates eight 3x1 subpatterns for a pattern of 4x4' do
    larger_radar = Invaders::ReflectionPattern.new(<<~RADAR
                                      ----
                                      o--o
                                      -oo-
                                      ----
                                    RADAR
                                   )
    subpatterns = Invaders::IterativeSubPatternGenerator.new(larger_radar).subpatterns(height: 3, width: 1)
    expect(subpatterns.count).to eq(8)
    subpatterns.each { |subpat| expect(subpat.height).to eq(3) }
    subpatterns.each { |subpat| expect(subpat.width).to eq(1) }
  end

  it 'stores the coordinates in each pattern' do
    subpatterns = Invaders::IterativeSubPatternGenerator.new(tiny_radar).subpatterns(height: 1, width: 1)
    expect(subpatterns.count).to eq(4)
    coordinates = subpatterns.map(&:coordinates)
    expect(coordinates).to include([[0, 0], [0, 0]])
    expect(coordinates).to include([[0, 1], [0, 1]])
    expect(coordinates).to include([[1, 0], [1, 0]])
    expect(coordinates).to include([[1, 1], [1, 1]])
  end
end
