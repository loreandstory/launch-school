def sum_or_product
  # Input: prompt for integer. Prompt user for operation: sum or product
  # Output: sum or product (depending on user's choice) from 1 to integer
  #
  # Assumptions:
  #   - Integer is > 0

  print "\n=> Please enter an integer greater than 0: "
  integer_to = gets.to_i

  print "=> Enter 's' to compute the sum, 'p' to compute the product: "
  operation = gets.chomp

  integer_array = (1..integer_to).to_a

  result = case operation
           when 's'
             integer_array.sum
           when 'p'
             integer_array.reduce(&:*)
           end
  puts "\nThe sum of the integers between 1 and #{integer_to} is #{result}."

  result
end

sum_or_product
sum_or_product
