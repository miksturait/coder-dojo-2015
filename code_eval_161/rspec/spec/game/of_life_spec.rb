describe Game::OfLife do
  context 'next generation world' do
    let(:initial_state) { ".......\n.***...\n.......\n.......\n...*...\n...*...\n...*...\n" }
    let(:world) { described_class.new(initial_state) }
    let(:final_state) { "..*....\n..*....\n..*....\n.......\n.......\n..***..\n.......\n" }

    it { expect(world.dimension).to eq(7) }
    context "after computation" do
      before do
        world.next_generation
      end

      it { expect(world.display).to eq(final_state) }
    end
  end

  context '10th generation world' do
    let(:final_state) { "..........\n...*......\n..*.*.....\n..*.*.....\n...*......\n..........\n..........\n..........\n..........\n..........\n" }
    let(:world) { described_class.new(initial_state) }
    let(:initial_state) { ".........*\n.*.*...*..\n..........\n..*.*....*\n.*..*...*.\n.........*\n..........\n.....*..*.\n.*....*...\n.....**...\n" }

    context "after computation" do
      before do
        world.generation(10)
      end

      it { expect(world.display).to eq(final_state) }
    end
  end
end
