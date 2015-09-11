describe Game::OfLife do
  let(:initial_state) { "00000\nf0000\ne0000\na0000\n0b000\n" }
  let(:world) { described_class.new(initial_state )}

  it { expect(world.dimension).to eq(5) }

  it 'next generation world'
  it 'nth generation world'
end
