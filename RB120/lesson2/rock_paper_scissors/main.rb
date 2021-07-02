$LOAD_PATH << 'modules/'

require 'interface_with_user'
require 'game_display'
require 'players'

class Game
  attr_reader :wins, :loses, :ties, :name, :code, :player, :computer, :winner

  def initialize
    self.wins = 0
    self.loses = 0
    self.ties = 0
    self.name = 'Rock Paper Scissor'

    display_welcome
    choose_game

    display_game_choosen
    @player = Human.new
  end

  def play
    self.computer = Computer.new
    display_players

    player.move(code)
    computer.move(code)
    display_moves

    self.winner = determine_winner
    update_score

    display_score
    play if continue?
  end

  private
  attr_writer :wins, :loses, :ties, :name, :code, :computer, :winner

  include InterfaceWithUser
  include GameDisplay

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
  end

  def update_score
  end

  def continue?
  end
end

game = Game.new
game.play
