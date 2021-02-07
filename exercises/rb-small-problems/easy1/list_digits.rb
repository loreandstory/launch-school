def digit_list(integer_digits)
  puts "valid integer not entered" unless integer_digits.class == Integer

  integer_digits
    .to_s
    .chars
    .map(&:to_i)
end

# Error test case
digit_list(4.5)

# Provided test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
