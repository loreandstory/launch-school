def average(integer_array)
  # Input: array of integer numbers
  # Output: interget average of number in array (sum divided by size of array)
  # 
  # Assumptions: all integers in integer_array are valid, positive integers
  sum = integer_array.reduce(:+)
  size = integer_array.size

  sum / size  # add .to_f  to size to make return value a float, not integer.
end

puts average([1, 3, 6, 9])

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
