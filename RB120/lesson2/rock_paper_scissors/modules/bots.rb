$LOAD_PATH << "."

require 'moves'

class Bot
  def choose(game_code, possible_moves)
    possible_moves.sample
  end

  private

  def preference(possible_moves, preferred_choice, tries)
    choice = nil
    i = 0

    while choice != preferred_choice && i < tries do
      choice = possible_moves.sample
      i += 1
    end

    choice
  end
end

class Walle < Bot
  def choose(game_code, possible_moves)
    game_code == 'rps' ? 'scissors' : ['scissors', 'spock'].sample
  end

end

class R2D2 < Bot
  def choose(game_code, possible_moves)
    if game_code == 'rps'
      preference(possible_moves, 'rock', 3)
    else
      preference(possible_moves, ['rock', 'lizard', 'lizard'].sample, 2)
    end
  end
end

class C3PO < Bot
  def choose(game_code, possible_moves)
    if game_code == 'rps'
      preference(possible_moves, 'paper', 2)
    else
      preference(possible_moves, 'spock', 3)
    end
  end
end

class BB8 < Bot
  def choose(game_code, possible_moves)
    if game_code == 'rps'
      preference(possible_moves, ['rock', 'paper'].sample, 2)
    else
      preference(possible_moves, ['rock', 'paper', 'lizard'].sample, 2)
    end
  end
end

class Hal < Bot
  def choose(game_code, possible_moves)
    if game_code == 'rps'
      preference(possible_moves, 'rock', 3)
    else
      'spock'
    end
  end
end

class Sonny < Bot
  def choose(game_code, possible_moves)
    game_code == 'rps' ? 'paper' : ['paper', 'spock', 'spock'].sample
  end
end
