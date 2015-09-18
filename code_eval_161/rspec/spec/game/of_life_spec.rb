describe Game::OfLife do
  context 'next generation world' do
    let(:initial_state) { ".......\n.***...\n.......\n.......\n...*...\n...*...\n...*...\n" }
    let(:world) { described_class.new(initial_state) }
    let(:final_state) { "..*....\n..*....\n..*....\n.......\n.......\n..***..\n.......\n" }

    it { expect(world.dimension).to eq(7) }
    it { expect(world.next_generation).to eq(final_state) }
  end

  context '10th generation world' do
    let(:final_state) { "..........\n...*......\n..*.*.....\n..*.*.....\n...*......\n..........\n..........\n..........\n..........\n..........\n" }
    let(:world) { described_class.new(initial_state) }
    let(:initial_state) { ".........*\n.*.*...*..\n..........\n..*.*....*\n.*..*...*.\n.........*\n..........\n.....*..*.\n.*....*...\n.....**...\n" }

    it { expect(world.generation(10)).to eq(final_state) }
  end
end
