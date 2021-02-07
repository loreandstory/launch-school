def room_size
  # Input: none, except gets room length/width from user
  # Output: room size (area), output as float (in m^2 & ft^2)
  #
  # Assumptions: user input length/width are floats
  #              that will not need to be validated

  print "Enter room length (m): "
  length = gets.chomp.to_f

  print "Enter room width (m): "
  width = gets.chomp.to_f

  size_sq_m = length * width
  size_sq_ft = size_sq_m * 10.7639

  "\nThe area of the room is #{size_sq_m} square meters (#{size_sq_ft} square feet)."
end

puts room_size
