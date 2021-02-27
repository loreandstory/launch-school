def valid_integer?(int)
  int =~ /^\d+$/
end

def get_integer(prompt_pretext)
  print "\n#{prompt_pretext} ==> Enter a number: "
  user_input = gets.chomp
  
  until valid_integer?(user_input)
    print "> Please enter a valid integer: "
    user_input = gets.chomp
  end

  user_input.to_i
end

def search_numbers(number_to_request=5)
  saved_numbers = Array.new
  final_number = nil
  
  while saved_numbers.size < number_to_request
    current_request_number = saved_numbers.size + 1
    saved_numbers << get_integer("Integer #{current_request_number} ")
  end
  
  final_number = get_integer("Final integer ")

  final_number_present = saved_numbers.include?(final_number)
  insert_whether_found = final_number_present ? nil : "not "

  print "\nThe number #{final_number} does #{insert_whether_found}appear in #{saved_numbers}\n\n"
end

search_numbers

search_numbers(3)
