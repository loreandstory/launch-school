$LOAD_PATH << 'modules/'

require 'rules'
require 'interface_with_user'
require 'game_display'
require 'players'


class Game
  attr_reader :wins, :loses, :ties, :name, :code, :player, :computer, :winner

  include Rules

  POSSIBLE_MOVES = {
                     'rock'     => Rock.new,
                     'paper'    => Paper.new,
                     'scissors' => Scissors.new,
                     'lizard'   => Lizard.new,
                     'Spock'    => Spock.new
                   }

  def initialize
    self.wins = 0
    self.loses = 0
    self.ties = 0

    self.name = 'Rock Paper Scissor'
    display_welcome
    self.code = choose_game_type

    self.name = ('ls' == code) ? 'Lizard Spock' : 'Rock Paper Scissors'
    display_game_choosen
    @player = Human.new
  end

  def play
    self.computer = Computer.new
    display_game

    player.move(RULES[code])
    computer.move(RULES[code])
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

  def choose_game_type
    print <<-CHOOSE_GAME
      What version of Rock Paper Scissors would you like to play?

        |Input|        |Game Type|
          rps     ->    Rock Paper Scissors
          ls      ->    Lizard Spock
    CHOOSE_GAME

    fetch_input("Enter game type", ['rps', 'ls'])
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
