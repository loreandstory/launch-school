require 'pry'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num_str)
  /^\d/ =~ num_str
end

def valid_operation?(operation_str)
  %w(1 2 3 4).include?(operation_str)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Initialize varriables
num1 = nil
num2 = nil
operation = nil

# Get username and greet
puts "Welcome to calculator! Enter your name: "
name = gets.chomp
puts("Hello #{name}!\n")

# Begin calculation loop
loop do
  loop do
    prompt("Input first number: ")
    num1 = gets.chomp
    break if valid_number?(num1)
    puts("Invalid number. Please try again")
  end

  loop do
    prompt("Input second number: ")
    num2 = gets.chomp
    break if valid_number?(num2)
    puts("Invalid number. Please try again")
  end

  loop do
    operation_prompt = <<-MSG
      What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide

      Enter number for desired operation:#{' '}
    MSG
    prompt(operation_prompt)
    operation = gets.chomp
    break if valid_operation?(operation)
    puts("Invalid operation. Please try again")
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  puts("The result is: #{result}")

  puts("Would you like to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

puts("Thank you for using calculator.rb! Have a nice day.")
