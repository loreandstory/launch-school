module GameDisplay
  def new_page
    system('clear')
    puts "| #{name} |"
  end

  def header(text)
    print "\n" + text + "\n"
  end

  def display_welcome
    new_page
    header("Welcome to Rock Paper Scissors!")
  end

  def display_game_choosen
    new_page
    header("You chose #{name}")
  end

  def display_players
    new_page
    header("Welcome #{player}!")
    puts "You are playing against: #{computer}"
  end

  def display_moves
  end

  def display_winner
  end

  def display_score
  end

  def display_move_history
  end
end
