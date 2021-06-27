module Prompt
  def prompt(message, data=nil)
    print message
    if data != nil
      puts
      puts data
      print "\n=> "
    end
  end
end

class Player
  attr_accessor :choice

  def initialize
    @choice = nil
  end

  def reset
    self.choice = nil
  end
end

class Human < Player
  include Prompt

  def choose(options)
    options_list = options.map { |option| ' - ' + option }
    loop do
      prompt("Please enter your choice from the following:", options_list)
      player_input = gets.chomp
      self.choice = player_input if options.include?(player_input)
      break if choice != nil
      puts " ? I'm sorry, I couldn't understand your input. Could you please try again?"
      puts
    end
    puts
  end
end

class Computer < Player
  def choose(options)
    self.choice = options.sample
 end
end

class Rules
  RPS_RULES = {
    'rock' => ['scissors'], 'paper' => ['rock'], 'scissors' => ['paper']
  }.freeze

  LS_RULES = {
    'rock'     => ['scissors', 'lizard'],
    'paper'    => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard'   => ['paper', 'spock'],
    'spock'    => ['scissors', 'rock']
  }.freeze

  RULES = { 'rps' => RPS_RULES, 'ls' => LS_RULES }

  attr_reader :choices, :loses_to

  def initialize(game_name)
    @choices = RULES[game_name].keys
    @loses_to = RULES[game_name]
  end
end

class RPSGame
  include Prompt

  @@player_wins  = 0
  @@player_loses = 0
  @@ties  = 0

  attr_reader :player, :computer, :title, :rules

  def initialize(game_name)
    @player = Human.new
    @computer = Computer.new
    @title = game_name == 'rps' ? "| Rock Paper Scissors |" : "| Lizard Spock |"
    @rules = Rules.new(game_name)
  end

  def print_stats
    puts "Player stats:", [" - wins: #{@@player_wins}", " - loses: #{@@player_loses}", " - ties: #{@@ties}"]
    puts
  end

  def display_title_and_status
    system('clear')
    puts title
    puts
    print_stats
  end

  def decide_and_display_winner(player, computer)
    winner = if player.choice == computer.choice
               @@ties += 1
               "% player and computer made the same choice ==> Tie!"
             elsif rules.loses_to[player.choice].include?(computer.choice)
               @@player_wins += 1
               "% #{player.choice} beats #{computer.choice} ==> Player wins!"
             else
               @@player_loses += 1
               "% #{computer.choice} beats #{player.choice} ==> Computer wins!"
             end
    puts "Player chose: #{player.choice}", "Computer chose: #{computer.choice}"
    puts
    puts winner
    print "\n\n"
  end

  def play
    display_title_and_status
    player.choose(rules.choices)
    computer.choose(rules.choices)
    decide_and_display_winner(player, computer)
    continue_or_display_goodbye_message
  end

  def continue_or_display_goodbye_message
    continue = nil
    loop do
      prompt("--------- Would you like to play again (y/n)? ")
      continue = gets.chomp
      break if continue.match?(/^y(es)?|n(o)?$/i)
      puts "------- ? I'm sorry, I couldn't understand your input. Could you please try again?"
      puts
    end
    puts

    if continue.match?(/^n(o)?$/i)
      puts "Here's how you did:"
      puts
      print_stats
      puts "Hope you had fun and come back again!"
    else
      player.reset
      computer.reset
      play
    end
  end
end


option = nil
system('clear')

while option == nil
  print "\nWhat would you like to play?\n  1) Rock Paper Scissors\n  2) Lizard Spock"
  print "\n\n=> Enter number for option: "

  option = case gets.chomp
           when '1' then 'rps'
           when '2' then 'ls'
           else          puts("Input not valid. Please enter 1 or 2 to play.")
           end
end

RPSGame.new(option).play
