loop do
  print "How many times would you like to print (>= 3 at least)? (q to quite): "
  input = gets.chomp.downcase
  
  if input == "q" then break
  elsif input.to_i < 3
    puts "That's not enough lines - try 3 or more!"
    next
  else pr_times = input.to_i
  end
  
  loop do
    puts "Launch School is awesome!"
    pr_times -= 1
    break if pr_times < 1
  end

end
