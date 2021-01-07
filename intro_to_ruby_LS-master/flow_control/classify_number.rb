print "Enter number between 0 and 100: "
num = gets.chomp.to_i
p num
if (num >= 0) && (num <= 50)
  puts "Between 0 and 50"
elsif (num >= 51) && (num <= 100)
  puts "Between 50 and 100"
elsif num > 100
  puts "Greater than 100"
else
  puts "Not valid"
end