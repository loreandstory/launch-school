# Write a method that returns on ASCII string value of a string that is passed in as an argument.
#
# The ASCII string value is the sum of the ASCII values of every character in the string (may use String#ord to determine the ASCII value of a character).

def ascii_value(string)
  string.chars.reduce(0) { |sum, char| sum + char.ord }
end

# Test cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
