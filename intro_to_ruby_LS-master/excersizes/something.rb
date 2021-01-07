loop do
	print "Would you like me to print something? (y/n): "
  answer = gets.chomp.upcase
  if %w(Y N).include?(answer)
    puts "something" if answer == "Y"
    break
  end
  puts "Not a valud input! Please try again..."
end
