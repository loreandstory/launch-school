def retire_age
  # Input: prompt user for 1) age, 2) desired retirement age.
  # Output: print 1) current year, 2) retirement year, and 3) years to reach
  #
  # Assumptions: ages => integers, years => yyyy format (i.e. 2021)
  
  print "What is your age?: "
  current_age = gets.to_i

  print "At what age would you like to retire?: "
  retirement_age = gets.to_i

  years_to_retirement = retirement_age - current_age

  current_year = Time.now.year
  retirement_year = current_year + years_to_retirement

  puts "\nIt's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_to_retirement} years of work to go!"

  [
    current_age, retirement_age, years_to_retirement,
    current_year, retirement_year
  ]
end

retire_age
