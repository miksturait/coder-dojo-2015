describe CashRegister do

  let(:register) { described_class.new(pp, cc) }

  describe 'rest' do
    context 'PP<CC' do
      let(:pp) { 15.94 }
      let(:cc) { 16.00 }
      it { expect(register.odd_money).to eq(0.06) }
    end

    context 'PP>CC' do
      let(:pp) { 17.00 }
      let(:cc) { 16.00 }
      it { expect(register.odd_money).to eq('ERROR') }
    end

    context 'PP=CC' do
      let(:pp) { 17.00 }
      let(:cc) { 17.00 }
      it { expect(register.odd_money).to eq('ZERO') }
    end
  end
end
