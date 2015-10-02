$:.unshift File.dirname(__FILE__)

require('../lib/cash_register')

File.open(ARGV[0], 'r').each_line do |line|
  input = line.split(';').map(&:to_f)
  odd_coins = CashRegister.new(*input)
  puts odd_coins.odd_money
end
