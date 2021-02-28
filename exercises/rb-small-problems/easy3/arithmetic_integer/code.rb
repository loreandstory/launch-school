def valid_int?(int_text)
  int_text =~ /^\d+$/
end

def get_valid_int(prompt)
  user_input = nil
  print "\n==> #{prompt}"
  
  loop do
    user_input = gets.chomp
    break if valid_int?(user_input)
    print "> Please enter a valid integer: "
  end
  
  user_input.to_i
end

def arithmetic_integer
  int1 = get_valid_int("Enter the first number: ")
  int2 = get_valid_int("Enter the second number: ")

  operations_hash = {
                      '+':  (int1 + int2),
                      '-':  (int1 - int2),
                      '*':  (int1 * int2),
                      '/':  (int1 / int2),
                      '%':  (int1 % int2),
                      '**': (int1 ** int2)
                    }
  puts

  operations_hash.each do |operation,result|
    puts "==> #{int1} #{operation} #{int2} = #{result}"
  end
end

arithmetic_integer
