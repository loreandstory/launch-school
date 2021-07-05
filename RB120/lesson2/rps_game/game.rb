class Game
  attr_reader :type, :score, :history

  GAME_TYPES = ['rps', 'ls'].freeze

  def initialize
    @winner = ""
    @score = { wins: 0, loses: 0, ties: 0 }
    @history = { winners: [], player: [], computer: [] }
    self.type=(nil)
  end

  def update(player, computer)
    winner = if player.move > computer.move
               score[:wins] += 1
               player.name
             elsif player.move < computer.move
               score[:loses] += 1
               computer.name
             else
               score[:ties] += 1
               'tie'
             end

    history[:winners]  << winner
    history[:player]   << [player.name, player.move]
    history[:computer] << [computer.name, computer.move]
  end

  def winner
    history[:winners].last
  end

  def print_score
    player = history[:player].last.first

    puts "#{player}, the current score is..."
    print "\n  |Score|"
    print "\n    wins  => #{score[:wins]}"
    print "\n    loses => #{score[:loses]}"
    print "\n    ties  => #{score[:ties]}"
  end

  def print_history
  end

  private

  def prompt(message)
    print "\n=> " + message + ": "
  end

  def type=(n)
    puts "Game Options..."
    print "\n  |Input|"
    print "\n    rps => Rock Paper Scissors"
    print "\n    ls  => Lizard Spock\n"

    prompt("Choose your game type")
    @type = gets.chomp

    return if GAME_TYPES.include? type

    puts "Please enter a valid game type..."
    self.type=(n)
  end
end
