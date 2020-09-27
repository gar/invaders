require_relative '../../lib/invaders/reflection_pattern'

RSpec.describe Invaders::ReflectionPattern do
  let(:ufo_pattern) {
    Invaders::ReflectionPattern.new(
      <<~UFO
        --oo--
        oooooo
        -oooo-
      UFO
    )
  }

  it 'can report its height' do
    expect(ufo_pattern.height).to eq(3)
  end

  it 'can report its width' do
    expect(ufo_pattern.width).to eq(6)
  end

  it 'exposes a matrix of the pattern elements' do
    matrix = ufo_pattern.matrix

    expect(matrix.length).to eq(3)
    matrix.each { |row| expect(row.length).to eq(6) }
  end

  it 'reports the number of cells it contains as its area' do
    expect(ufo_pattern.area).to eq(18)
  end
end
