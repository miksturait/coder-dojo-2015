describe Game::Neighbours do
  let(:index) { 10 }
  #..*.
  #....
  #****
  #.***
  let(:world) { '..*.....****.***' }
  let(:world_size) {4}
  let(:neighbours) {described_class.new(index, world, world_size)}

  it {expect(neighbours.live_amount).to eq(5)}

end
