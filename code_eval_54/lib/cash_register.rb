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
    x(reminder).join(',')
  end

  def reminder
     (customer_cash - purchase_price).round(2)
  end

  def x(decimal_number)
    decimal_number = decimal_number.round(2)
    return([]) if mapping.empty?
    symbol, divider = mapping.shift
    ((decimal_number/divider).to_i.times.map {symbol.to_s}).concat x(decimal_number % divider)
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
