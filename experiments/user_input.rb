print "What is your name? "
user_name = gets
print user_name
puts "Above without .chomp on gets\n\n"

print "What is your user tag name? "
user_tag = gets.chomp
print user_tag
print "Above wth .chomp added to get\n\n"

puts "Note how without .chomp added to gets, we end up with input+\'\\n\'"
puts ".chomp just removes this trailing '\\n' from being added to the user\'s input"
