describe Game::OfLife do
  let(:initial_state) { ".......\n.***...\n.......\n.......\n...*...\n...*...\n...*...\n" }
  let(:world) { described_class.new(initial_state )}

  it { expect(world.dimension).to eq(7) }

  it 'next generation world'   do
    expect(world.next_generation).to eq("..*....\n..*....\n..*....\n.......\n.......\n..***..\n.......\n")
  end
  it 'nth generation world'
end
