require 'pry'

def calculator

  puts "Welcome to Calculator!"
  puts
  print "Input first number: "
  num1 = gets.chomp
  print "Input second number: "
  num2 = gets.chomp
  print "Input operation (add, subtract, etc.): "
  operation_string = gets.chomp

  case operation_string
  when "add" then puts(num1.to_i + num2.to_i)
  when "subtract" then puts(num1.to_i - num2.to_i)
  when "multiply" then puts(num1.to_i * num2.to_i)
  when "divide" then puts(num1.to_f / num2.to_f)
  else puts "Invalid opration!"
  end

end

calculator
