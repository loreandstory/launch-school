$LOAD_PATH << "."

require 'rules'
require 'interface_with_user'
require 'moves'
require 'bots'

class Players
  attr_reader :name, :choice

  POSSIBLE_MOVES = {
                     'rock'     => Rock.new,
                     'paper'    => Paper.new,
                     'scissors' => Scissors.new,
                     'lizard'   => Lizard.new,
                     'spock'    => Spock.new
                   }

  def to_s
    name
  end

  private

  include InterfaceWithUser
  attr_writer :choice
end

class Human < Players
  def initialize
    p Game.name
    @name = fetch_player_name
  end

  def move(game_code)
    possible_moves = Rules::ACCESSOR[game_code].keys

    print "\nYou can make the following moves:\n"
    print "\n   |Input|\n"
    possible_moves.each { |move| puts "    #{move}" }

    player_move = fetch_input("Choose your move", possible_moves)
    self.choice = POSSIBLE_MOVES[player_move]
  end
end

class Computer < Players
  BOTS = {
           'Bot'   => Bot.new,
           'Walle' => Walle.new,
           'R2D2'  => R2D2.new,
           'C3PO'  => C3PO.new,
           'BB8'   => BB8.new,
           'Hal'   => Hal.new,
           'Sonny' => Sonny.new
         }

  def initialize
    @name = BOTS.keys.sample
    @personality = BOTS[name]
  end

  def move(game_code)
    possible_moves = Rules::ACCESSOR[game_code].keys

    computer_move = personality.choose(game_code, possible_moves)
    self.choice = POSSIBLE_MOVES[computer_move]
  end

  attr_reader :personality
end
