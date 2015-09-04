describe Game::CoordinatePositionConverter do
  let(:converter) {described_class.new(10)}

  it {expect(converter.to_index([0,0])).to eq(0)}
  it {expect(converter.to_index([9,9])).to eq(99)}
  it {expect(converter.to_index([0,1])).to eq(10)}
  it {expect(converter.to_index([1,0])).to eq(1)}

  it {expect(converter.to_coordinate(99)).to eq([9,9])}
  it {expect(converter.to_coordinate(0)).to eq([0,0])}
  it {expect(converter.to_coordinate(13)).to eq([3,1])}
end
