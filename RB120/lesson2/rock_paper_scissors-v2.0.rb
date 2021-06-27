class Player
  attr_accessor :name, :choice
  def to_s() name; end
end

class Human < Player
  def initialize(n)
    @name = n
  end

  def choose(options)
    chosen_option = ""
    loop do
      print "=> Enter you choice: "
      chosen_option = gets.chomp
      break if options.keys.include? chosen_option
      puts "Option not found. Please try again."
    end

    self.choice = options[chosen_option]
  end
end

class Computer < Player
  NAMES = ['R2D2', 'Hal', 'Sonny', 'C3PO', 'BB9']

  def initialize
    @name = NAMES.sample
  end

  def choose(options)
    choice_string = options.keys.sample
    self.choice = options[choice_string]
  end
end

# Desired usage:
player = Human.new('Bob')
computer = Computer.new

puts player
puts computer
# Each one has ability to choose option and name,
# computer does soe automatically

class NilChoice
  RULES = {
  # choice =beats> other_choices
    'rock'     => ['scissors', 'lizard'],
    'paper'    => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard'   => ['paper', 'spock'],
    'spock'    => ['scissors', 'rock']
  }.freeze

  attr_accessor :choice

  def >(other)
    RULES[choice].include? other.choice
  end

  def <(other)
    RULES[other.choice].include? choice
  end
end

class Rock < NilChoice
  def initialize() self.choice = 'rock'; end
end

class Paper < NilChoice
  def initialize() self.choice = 'paper'; end
end

class Scissors < NilChoice
  def initialize() self.choice = 'scissors'; end
end

class Lizard < NilChoice
  def initialize() self.choice = 'lizard'; end
end

class Spock < NilChoice
  def initialize() self.choice = 'spock'; end
end

class Game
  OPTIONS = {
              'rock'     => Rock.new,
              'paper'    => Paper.new,
              'scissors' => Scissors.new
            }.freeze

  player = Human.new('Bob')
  player.choose(OPTIONS)
  computer = Computer.new
  computer.choose(OPTIONS)
  p player
  p computer
end

class RPS < Game
end

class LS < Game
  OPTIONS = {
              'rock'     => Rock.new,
              'paper'    => Paper.new,
              'scissors' => Scissors.new,
              'lizard'   => Lizard.new,
              'spock'    => Spock.new
            }.freeze
end
# Desired Ussage:

choice1 = Paper.new
choice2 = Rock.new

p choice1 > choice2 # => true
p choice1 < choice2 # => true

choice3 = NilChoice.new
p choice3.choice
