def greet_user
  print "\n=> What is your name?: "
  user_name = gets.chomp


  if /!$/ =~ user_name 
    user_name.delete!('!')
    puts "\nHELLO #{user_name.upcase}. WHY ARE WE YELLING?!"
  else
    puts "\nHello #{user_name}."
  end
end

greet_user
greet_user
