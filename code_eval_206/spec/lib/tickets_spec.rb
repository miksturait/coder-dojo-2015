describe Tickets do

  describe "#is_lucky_ticket?" do

    context "9999" do
      it "return true" do
        expect(Tickets.new("9999").is_lucky_ticket?).to eq(true)
      end
    end

    context "1278" do
      it "return false" do
        expect(Tickets.new("1278").is_lucky_ticket?).to eq(false)
      end
    end

    context "00252500" do
      it "return true" do
        expect(Tickets.new("00252500").is_lucky_ticket?).to eq(true)
      end
    end
  end
end
