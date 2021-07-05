module Display
  def self.new_page(name)
    system('clear')
    puts "| #{name} |"
  end

  def self.header(text)
    print "\n" + text + "\n"
  end

  def self.welcome(name)
    new_page(name)
    header("Welcome to Rock Paper Scissors!")
  end

  def self.game_choosen(name)
    new_page(name)
    header("You chose #{name}")
  end

  def self.players(name, player, computer)
    new_page(name)
    header("Welcome #{player}!")
    puts "You are playing against: #{computer}"
  end

  def self.moves(name, player, computer)
    new_page(name)
    header("Moves chosen...")
    puts "#{player} => #{player.choice}"
    puts "#{computer} => #{computer.choice}"
    puts "#{player.choice > computer.choice}"
    puts "#{player.choice < computer.choice}"
  end

  def self.winner(winner)
    puts "Winner this round: #{winner}"
  end

  def self.score(wins, loses, ties)
    puts "Score:"
    puts "wins: #{score[:wins]}"
    puts "loses: #{score[:loses]}"
    puts "ties: #{score[:ties]}"
  end

  def self.move_history
  end
end
