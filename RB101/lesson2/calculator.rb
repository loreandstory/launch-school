require 'pry'

def calculator

  puts "Welcome to Calculator!"
  puts
  print "Input first number: "
  num1 = gets.chomp.to_i
  print "Input second number: "
  num2 = gets.chomp.to_i
  print "Input operation (add, subtract, etc.): "
  operation_string = gets.chomp

  case operation_string
  when "add" then puts(num1 + num2)
  when "subtract" then puts(num1 - num2)
  when "multiply" then puts(num1 * num2)
  when "divide" then puts(num1 / num2)
  else puts "Invalid opration!"
  end

end

calculator
