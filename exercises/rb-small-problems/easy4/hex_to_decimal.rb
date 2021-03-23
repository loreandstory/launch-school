require 'pry'

HEX = {
  '0' => 0, '1' => 1, '2' => 2,
  '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, 'A' => 10, 'B' => 11,
  'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15,
}

def hex_to_decimal(hex_string)
  hex_array = hex_string.chars

  converted_array = hex_array.map { |char| HEX[char] }

  value = 0

  converted_array.each { |digit| value = value * 16 + digit }

  value
end

p hex_to_decimal('AF3')
