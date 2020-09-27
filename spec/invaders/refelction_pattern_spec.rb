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
end
