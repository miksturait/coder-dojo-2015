class Roman
  attr_reader :decimal

  def initialize(decimal)
    @decimal = decimal
  end

  def to_s
    decimal_to_roman(decimal)
  end

  private

  def decimal_to_roman(decimal_number)
    return('') if mapping.empty?
    symbol, divider = mapping.shift
    (symbol * (decimal_number/divider)) + decimal_to_roman(decimal_number % divider)
  end

  def mapping
    @mapping ||= [
        ['M', 1000],
        ['CM', 900],
        ['D', 500],
        ['CD', 400],
        ['C', 100],
        ['XC', 90],
        ['L', 50],
        ['XL', 40],
        ['X', 10],
        ['IX', 9],
        ['V', 5],
        ['IV', 4],
        ['I', 1]
    ]
  end
end

require '../support/process_file'
ProcessFile.new { |number_string| puts Roman.new(number_string.to_i) }

