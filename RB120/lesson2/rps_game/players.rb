class Players
  attr_reader :name, :move

  POSSIBLE_MOVES = {
                     'rps' => {
                                'rock'     => Rock.new,
                                'paper'    => Paper.new,
                                'scissors' => Scissors.new
                              },

                     'ls'  =>  {
                                 'rock'     => Rock.new,
                                 'paper'    => Paper.new,
                                 'scissors' => Scissors.new,
                                 'lizard'   => Lizard.new,
                                 'spock'    => Spock.new
                               }
                    }.freeze

  def to_s
    name
  end

   private

  attr_writer :move
end

class Human < Players
  def initialize
    self.name=(nil)
  end

  def choose_move(game_type)
    moves = POSSIBLE_MOVES[game_type]
    moves.keys.each { |move| puts move }

    prompt("Choose your move")
    self.move = gets.chomp

    return self.move = moves[move] if moves.keys.include? move

    puts "Please enter a valid move..."
    choose_move(game_type)
  end

  private

  def prompt(message)
    print "\n=> " + message + ": "
  end

  def name=(n)
    prompt("Enter what you would like to be called Player")
    @name = gets.chomp

    return unless @name.empty?

    puts "Please enter something..."
    self.name=(n)
  end
end

class Computer < Players
  def initialize() @name = 'Computer'; end
  def choose_move(game_type)
    moves = POSSIBLE_MOVES[game_type].values
    self.move = personality(moves)
  end

  def personality(moves)
    moves.sample
  end
end

class R2D2 < Computer
end

class C3PO < Computer
end

class BB8 < Computer
end

class Walle < Computer
end

class Sonny < Computer
end

class Hal < Computer
end
