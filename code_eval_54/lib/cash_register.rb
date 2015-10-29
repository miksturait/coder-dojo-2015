class CashRegister < Struct.new(:purchase_price, :customer_cash)
  def odd_money
    if purchase_price < customer_cash
      coins
    elsif purchase_price == customer_cash
      'ZERO'
    else
      'ERROR'
    end
  end


  def coins
    coins_from_float(reminder).join(',')
  end

  def reminder
    (customer_cash - purchase_price).round(2)
  end

  def coins_from_float(float_number)
    float_number = float_number.round(2)
    return([]) if mapping.empty?
    symbol, divider = mapping.shift
    ((float_number/divider).to_i.times.map { symbol.to_s }).concat coins_from_float(float_number % divider)
  end

  def mapping
    @mapping ||= {
        'PENNY': 0.01,
        'NICKEL': 0.05,
        'DIME': 0.10,
        'QUARTER': 0.25,
        'HALF DOLLAR': 0.50,
        'ONE': 1.00,
        'TWO': 2.00,
        'FIVE': 5.00,
        'TEN': 10.00,
        'TWENTY': 20.00,
        'FIFTY': 50.00,
        'ONE HUNDRED': 100.00
    }.to_a.reverse
  end
end

a = 2
b = 6

a + b
