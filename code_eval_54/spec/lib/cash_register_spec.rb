describe CashRegister do

  let(:register) { described_class.new(pp, cc) }

  describe 'rest calculation' do
    context 'PP<CC' do
      let(:pp) { 15.94 }
      let(:cc) { 16.00 }
      it { expect(register.odd_money).to eq('NICKEL,PENNY') }
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

  describe 'change odd to cash' do
    context 'to one coin' do
      let(:pp) { 16.99 }
      let(:cc) { 17.00 }
      it { expect(register.coins).to eq('PENNY') }
    end
  end
end
