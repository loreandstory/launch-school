$LOAD_PATH << 'modules/'

require 'interface_with_user'
require 'display'
require 'players'
require 'Rules'

class Game
  attr_reader :name, :code, :player, :computer, :winner, :score, :history

  def initialize
    p LS
    self.score =   Score.new
    self.history = History.new
    self.name =   'Rock Paper Scissor'

    Display::welcome(name)
    choose_game

    Display::game_choosen(name)
    @player = Human.new
  end

  def play
    self.computer = Computer.new
    Display::players(name, player, computer)

    player.move(code)
    computer.move(code)
    Display::moves(name, player, computer)

    self.winner = determine_winner

    Display::score(score)
    # Display::history if see_history?

    play if continue?
  end

  private
  attr_writer :name, :code, :computer, :winner, :score, :history

  class Score
    def initialize
      @wins = 0
      @loses = 0
      @ties = 0
    end

    def update
      if winner == Game.player.name
        wins += 1
      elsif winner == Game.computer.name
        loses += 1
      else
        ties += 1
      end
    end

    private
    attr_accessor :wins, :loses, :ties
  end

  class History
    def initialize
      @winners = []
      @players = []
      @computer = []
    end

    private
    attr_accessor :winners, :player, :computer
  end

  include InterfaceWithUser

  def choose_game
    print "\n" + (<<~CHOOSE_GAME)
      What version of Rock Paper Scissors would you like to play?

        |Input|        |Game Type|
          rps     ->    Rock Paper Scissors
          ls      ->    Lizard Spock
    CHOOSE_GAME

    self.code = fetch_input("Enter game type", ['rps', 'ls'])
    self.name = ('ls' == code) ? 'Lizard Spock' : 'Rock Paper Scissors'
  end

  def determine_winner
    if player.choice > computer.choice
      player.name
    elsif player.choice < computer.choice
      computer.name
    else
      'tie'
    end
  end

  def continue?
    p Players.history
    puts 'please input...'
    gets.chomp
    true
  end
end

game = Game.new
game.play
