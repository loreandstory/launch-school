def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def only_pos?(num1, num2)
  num1 * num2 > 0
end

def add_and_display(num1, num2)
  result = num1 + num2
  puts "#{num1} + #{num2} = #{result}"
end


first_num = nil
second_num = nil

loop do
  print "Enter a positive or negative non-zero number: "
  first_num = gets.chomp

  print "Enter a positive or negative non-zero number: "
  second_num = gets.chomp

  unless valid_number?(first_num) && valid_number?(second_num)
    puts "Not a valid number. Both numbers must be valid and non-zero. Please try again..."
    next
  end

  first_num = first_num.to_i
  second_num = second_num.to_i

  if only_pos?(first_num, second_num)
    puts "One number must be positive and one must be negative. Please try again..."
    next
  else
    break
  end

end

add_and_display(first_num, second_num)
