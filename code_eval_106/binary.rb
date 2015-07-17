class BinaryNum
  attr_reader :decimal

  def initialize(decimal)
    @decimal = decimal
  end

  def to_s
    decimal_to_binary(decimal).reverse
  end

  private

  def decimal_to_binary(number)
    number == 0 ? '0' : binarize(number)
  end

  def binarize(number)
    return '' if number == 0
    (number % 2).to_s + binarize(number / 2)
  end
end

[0, 2, 4, 5, 53, 1024].each do |num|
  puts BinaryNum.new(num)
end

