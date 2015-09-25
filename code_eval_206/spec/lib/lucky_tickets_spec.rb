describe LuckyTickets do
  describe "#count_lucky_tickets" do
    it "profiles our awesome example" do
      require 'ruby-prof'
      result = RubyProf.profile do
        LuckyTickets.new(6).count_lucky_tickets
      end
      printer = RubyProf::GraphPrinter.new(result)
      printer.print(STDOUT, {})
    end

    it 'benchmarks the code' do
      require 'benchmark'
      result = Benchmark.measure do
        LuckyTickets.new(6).count_lucky_tickets
      end
      puts result
    end


    it "number of lucky tickets" do
      expect(LuckyTickets.new(4).count_lucky_tickets).to eq(670)
    end
    it "number of lucky tickets" do
      expect(LuckyTickets.new(6).count_lucky_tickets).to eq(55252)
    end
    it "number of lucky tickets" do
      expect(LuckyTickets.new(8).count_lucky_tickets).to eq(4816030)
    end
  end
  describe "#range" do
    context "4" do
      it "0..9999" do
        expect(LuckyTickets.new(4).range).to eq(0..9999)
      end
    end
    context "6" do
      it "0..999999" do
        expect(LuckyTickets.new(6).range).to eq(0..999999)
      end
    end
    context "8" do
      it "0..99999999" do
        expect(LuckyTickets.new(8).range).to eq(0..99999999)
      end
    end
  end

end
