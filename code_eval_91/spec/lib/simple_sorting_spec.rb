describe SimpleSorting do
  let(:numbers_as_strings) {%w(70.920 -38.797 14.354 99.323 90.374 7.581)}
  let(:sorting_object) {described_class.new(numbers_as_strings)}

  it {expect(sorting_object.to_s).to eq('-38.797 7.581 14.354 70.920 90.374 99.323')}
end
