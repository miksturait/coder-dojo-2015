BinaryNum = Struct.new(:decimal) do
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

require '../support/process_file'
ProcessFile.new do |line|
  puts(BinaryNum.new(line.to_i)) unless line.strip.empty?
end

