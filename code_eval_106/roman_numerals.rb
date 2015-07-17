decimal_number = 5650

m_elements = decimal_number / 1000
roman_number = 'M' * m_elements

d_elements = (decimal_number % 1000) / 500
roman_number << 'D' * d_elements

c_elements = ((decimal_number % 1000) % 500) / 100
roman_number << 'C' * c_elements

l_elements = (((decimal_number % 1000) % 500) % 100)  / 50
roman_number << 'L' * l_elements


puts roman_number

