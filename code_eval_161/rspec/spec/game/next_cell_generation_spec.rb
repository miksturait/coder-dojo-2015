describe Game::NextCellGeneration do
  let(:next_generation_service) { described_class.new(current_state, live_neighbours_count) }

  context 'Any live cell' do
    let(:current_state) { '*' }

    context 'with fewer than two live neighbors dies, as if caused by under-population' do
      context 'one' do
        let(:live_neighbours_count) { 1 }
        it { expect(next_generation_service.next_state).to eq('.') }
      end

      context 'zero' do
        let(:live_neighbours_count) { 0 }
        it { expect(next_generation_service.next_state).to eq('.') }
      end
    end

    context 'with two or three live neighbors lives on to the next generation' do
      context 'two' do
        let(:live_neighbours_count) { 2 }
        it { expect(next_generation_service.next_state).to eq('*') }
      end

      context 'three' do
        let(:live_neighbours_count) { 3 }
        it { expect(next_generation_service.next_state).to eq('*') }
      end
    end

    context 'with more than three live neighbors dies, as if by overcrowding' do
      context 'four' do
        let(:live_neighbours_count) { 4 }
        it { expect(next_generation_service.next_state).to eq('.') }
      end

      context 'eight' do
        let(:live_neighbours_count) { 8 }
        it { expect(next_generation_service.next_state).to eq('.') }
      end
    end
  end

  context 'Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction' do
    let(:current_state) { '.' }

    context 'three' do
      let(:live_neighbours_count) { 3 }
      it { expect(next_generation_service.next_state).to eq('*') }
    end

    context 'two' do
      let(:live_neighbours_count) { 2 }
      it { expect(next_generation_service.next_state).to eq('.') }
    end

    context 'four' do
      let(:live_neighbours_count) { 4 }
      it { expect(next_generation_service.next_state).to eq('.') }
    end
  end
end
