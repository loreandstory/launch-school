USER = "LS"
PSW = "Password"

loop do
  print "Enter username: "
  get_username = gets.chomp
  print "Enter password: "
  get_password = gets.chomp
  break if get_username == USER && get_password == PSW
  puts "Incorrect credentials. Please try again..."
end

puts "Welcome!"
