describe SimpleSorting do
  let(:sorting_object) { described_class.new(numbers_as_strings) }

  context "3'rd zero is added" do
    let(:numbers_as_strings) { %w(70.920 -38.797 14.354 99.323 90.374 7.581) }
    it { expect(sorting_object.to_s).to eq('-38.797 7.581 14.354 70.920 90.374 99.323') }
  end

  context "4'th or next zero are cutted" do
    let(:numbers_as_strings) { %w(70.920123 11.0000) }
    it { expect(sorting_object.to_s).to eq('11.000 70.920') }
  end
end
