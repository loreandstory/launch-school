def rotate_array(array)
  array[1..] + [array[0]]
end

def rotate_string(string)
  string_array = string.chars
  rotate_array(string_array).join
end

def rotate_integer(integer)
  stringified_number = integer.to_s
  rotate_string(stringified_number).to_i
end

# Using recursion to cycle digits number_to_rotate times
def rotate_digits(digits, number_to_rotate)
  return digits if number_to_rotate == 0

  rotate_rightmost_digits(rotate_integer(digits), number_to_rotate - 1)
end

## || Rotating rightmost digits
def rotate_rightmost_digits(digits, number_to_rotate)
  stringified_digits = digits.to_s

  untouched_part = stringified_digits[...-number_to_rotate]
  to_rotate_part = stringified_digits[-number_to_rotate..]
  p untouched_part, to_rotate_part

  digits_rightmost_rotated = untouched_part + rotate_string(to_rotate_part)
  digits_rightmost_rotated.to_i
end

p 735291
p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) #== 732915
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917
