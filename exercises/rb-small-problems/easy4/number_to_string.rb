TO_STRING = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9',
}

def integer_to_string(integer)
  working_number = integer
  stringified_int = ""

  count = 1
  loop do
    working_number, digit = working_number.divmod(10)
    stringified_int.prepend(TO_STRING[digit])
    
    break if working_number <= 0
    count += 1
  end

  stringified_int
end

def signed_integer_to_string(integer)
  stringified_int = integer_to_string(integer.abs)

  if integer < 0
    stringified_int.prepend('-')
  elsif integer > 0
    stringified_int.prepend('+')
  else
    stringified_int
  end
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
