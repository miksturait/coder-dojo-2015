describe CashRegister do

  let(:register) {described_class.new(15.94, 16.00)}

  context 'PP<CC' do
    it {expect(register.odd_money).to eq(0.06)}
  end

  context 'PP>CC' do

  end

  context 'PP=CC' do

  end


end
