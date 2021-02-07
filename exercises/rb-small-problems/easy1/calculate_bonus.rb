def calculate_bonus(salary, get_bonus = true)
  # Input: salary (positive integer) and get_bonus (boolean)
  # Output: calculated bonus (positive integer)
  #
  # Assumptions: get_bonus should default to true unless specified

  get_bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
