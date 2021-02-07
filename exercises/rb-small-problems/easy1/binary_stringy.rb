def stringy(int)
  # Want to take in an integer and output a string of alternating 1's and 0's with the following rules:
  # - string starts with 1
  # - string length == int
  
  binary_stringy = String.new

  for i in 1..int
    i % 2 == 1 ? binary_stringy << "1" : binary_stringy << "0"
  end
     
  binary_stringy
end

puts stringy(0)
puts stringy(8)

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
