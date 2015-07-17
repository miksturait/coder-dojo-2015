require 'pry'

roman_to_decimal = [
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

def decimal_to_roman(decimal_number, mapping)
  return('') if mapping.empty?
  symbol, divider = mapping.shift
  (symbol * (decimal_number/divider)) + decimal_to_roman(decimal_number % divider, mapping)
end

puts decimal_to_roman(99, roman_to_decimal)
