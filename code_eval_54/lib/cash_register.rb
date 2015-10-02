class CashRegister < Struct.new(:purchase_price, :customer_cash)
  def odd_money
    if purchase_price < customer_cash
      (customer_cash - purchase_price).round(2)
    elsif purchase_price == customer_cash
      'ZERO'
    else
      'ERROR'
    end
  end
end
