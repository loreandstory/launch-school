def rotate_digits(digits, rotate_number)
  final_index = digits.size - 1
  rotate_index = final_index - (rotate_number - 1)

  beginning_digits = digits[0...rotate_index]
  ending_digits = digits[rotate_index+1..final_index]
  rotated_digit = digits[rotate_index]

  beginning_digits + ending_digits + [rotated_digit]
end

# || Using recursion to perform max rotation
#    --> preserves multiple zeros in number
def max_rotation(number, digits=number.to_s.chars, number_of_rotations=digits.length)
  return digits.join.to_i if number_of_rotations == 1

  max_rotation(
                number,
                rotate_digits(digits, number_of_rotations),
                number_of_rotations - 1
              )
end

p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(100000005) #== 10500 # multiple zeros preserved
p max_rotation(8_703_529_146) #== 7_321_609_845
