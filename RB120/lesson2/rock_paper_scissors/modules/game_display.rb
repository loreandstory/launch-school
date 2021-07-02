module GameDisplay
  def title
    system('clear')
    puts "| #{name} |"
  end

  def display_welcome
    title
    print "\nWelcome to Rock Paper Scissors!\n"
  end

  def display_game_choosen
    title
    print "\nYou chose #{name}\n"
  end

  def display_game
    title
    print "\nChoose your moves\n"
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
