# First Attempt
def greetings(name_array, job_hash)
  first, middle_init, last = name_array
  
  greet_name_line = sprintf("Hello, %1s%2s %3s! ", first, middle_init, last)
  greet_job_line = sprintf("Nice to have a %<title>s %<occupation>s around.", job_hash)

  print "=> " + greet_name_line + greet_job_line + "\n"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Second attempt, shortened to make Rubocop happy
def greetings(name_array, job_hash)
  print "=> Hello, #{name_array.join(' ')}! "\
        "Nice to have a #{job_hash[:title]} #{job_hash[:occupation]} around.\n"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
