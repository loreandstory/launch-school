def sum(integer)
  # Input: integer
  # Output: sum of each digit of provided integer
  #
  # Assumptions:
  #  - integer is positive whole integer
  #  - output sum is also positive integer

  integer
    .to_s
    .split('')
    .reduce { |sum, digit| sum.to_i + digit.to_i }
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
