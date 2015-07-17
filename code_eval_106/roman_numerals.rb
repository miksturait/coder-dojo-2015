require 'pry'
decimal_number = 5650

m_elements = decimal_number / 1000
roman_number = 'M' * m_elements

d_elements = (decimal_number % 1000) / 500
roman_number << 'D' * d_elements

c_elements = ((decimal_number % 1000) % 500) / 100
roman_number << 'C' * c_elements

l_elements = (((decimal_number % 1000) % 500) % 100) / 50
roman_number << 'L' * l_elements


puts roman_number

roman_to_decimal = [
    ['M', 1000],
    ['D', 500],
    ['C', 100],
    ['L', 50],
    ['X', 10],
    ['V', 5],
    ['I', 1]
]

def decimal_to_roman(decimal_number, mapping)
  return('') if mapping.empty?
  symbol, divider = mapping.shift
  (symbol * (decimal_number/divider)) + decimal_to_roman(decimal_number % divider, mapping)

end

puts decimal_to_roman(3759, roman_to_decimal)
