print "Enter countdown start number: "
i = gets.chomp.to_i
j = i

while i >= 0
  puts i
  i -= 1
end

until j < 0
  puts j
  j -= 1
end

puts "Done"