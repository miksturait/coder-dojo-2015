describe Game::Neighbours do
  let(:world_size) { 10 }

  it { expect(service([0, 0]).reachable).to match_array([[1, 0], [0, 1], [1, 1]])}
  it { expect(service([9, 9]).reachable).to match_array([[8, 9], [9, 8], [8, 8]])}
  it { expect(service([0, 5]).reachable).to match_array([[0, 6], [0, 4], [1, 5], [1, 6], [1, 4]])}
  it { expect(service([4, 4]).reachable).to match_array([[3, 3], [3, 4], [3, 5], [4, 3], [4, 5], [5, 3], [5, 4], [5, 5]])}

  def service(starting_positions)
     described_class.new(starting_positions, world_size)
  end
end
