def valid_string?(string)
  string.class == String
end

def valid_pos_integer?(int)
  int.class == Integer && int > 0
end

def repeat(text, integer)
  if valid_string?(text) && valid_pos_integer?(integer)
    for i in 0...integer
      puts text
    end
  elsif !valid_string?(text) || !valid_pos_integer?(integer)
    puts "Error: argument 1 - please provide a valid string" if !valid_string?(text)
    puts "Error: argument 2 - please provide a valid integer" if !valid_pos_integer?(integer)
  else
    puts "Unknown error. Please try again."
  end
end

# Test error cases
repeat(5, 5)
puts ""
repeat("test", 3.5)
puts ""
repeat(5, "test")
puts ""

# Run valid case
repeat("hellow world!", 3)
