$LOAD_PATH << "."

require 'interface_with_user'
require 'moves'

class Players
  attr_reader :name, :choice, :history

  def initialize
    @history = []
  end

  private

  include InterfaceWithUser
  attr_writer :choice, :history
end

class Human < Players
  def initialize
    super
    @name = fetch_player_name
  end

  def move(game)
    player_move = fetch_input("Choose your move", game.keys)
    self.choice = Game::POSSIBLE_MOVES[player_move]
    history << player_move
  end
end

class Computer < Players
  def initialize
    super
    @name = 'bot'
  end

  def move(game)
    self.choice = game.keys.sample
  end
end
