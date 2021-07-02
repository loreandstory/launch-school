$LOAD_PATH << "."

require 'moves'

class Bot
  def initialize
    @name = 'R2D2'
    puts @name
  end

  def choose(game_code, possible_moves)
    possible_moves.sample
  end

  def to_s
    @name
  end
end

class Walle < Bot
end

class R2D2 < Bot
end

class C3PO < Bot
end

class BB8 < Bot
end

class Hal < Bot
end

class Sonny < Bot
end
