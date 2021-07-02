module InterfaceWithUser
  def prompt(text)
    print "\n=> #{text}: "
  end

  def valid_input?(user_input, valid_inputs = [])
    valid_inputs.include? user_input
  end

  def fetch_input(message, valid_inputs = [])
    prompt(message)
    user_input = gets.chomp

    return user_input if valid_input?(user_input, valid_inputs)

    puts "I'm sorry, I didn't understand your input. Please try again..."
    fetch_input(message, valid_inputs)
  end

  def fetch_player_name
    prompt("Enter your player name")
    player_name = gets.chomp

    return player_name unless player_name.empty?

    puts "Please enter valid text for your player name..."
    fetch_player_name
  end
end
