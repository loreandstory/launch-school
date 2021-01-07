def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def not_zero?(number_string)
  number_string.to_i != 0
end


numerator = ""
denominator = ""

loop do
  print "Enter numerator: "
  numerator = gets.chomp
  unless valid_number?(numerator)
    puts "Not a valid numerator. Please try again..."
    next
  end
  break
end


loop do
  print "Enter denominator: "
  denominator = gets.chomp
  unless valid_number?(denominator) && not_zero?(denominator)
    puts "Not a valid denominator. Please try again..."
    next
  end
  break
end

dividend = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} is #{dividend}"

