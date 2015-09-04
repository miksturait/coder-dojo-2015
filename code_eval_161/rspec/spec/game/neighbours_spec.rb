describe Game::Neighbours do
  let(:index) { 10 }
  #..*.
  #....
  #****
  #.***
  let(:world) { '..*.....****.***' }
  let(:world_dimension) {4}
  let(:neighbours) {described_class.new(index, world, world_dimension)}

  it {expect(neighbours.live_amount).to eq(5)}

  it {expect(neighbours.all).to match_array([9, 11, 5, 6, 7, 15, 13, 14])}

end
