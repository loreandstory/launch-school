require 'pry'

RPS_SHORTHAND = {
  r: 'rock',
  p: 'paper',
  s: 'scissors'
}
LSPOCK_SHORTHAND = {
  r: 'rock',
  p: 'paper',
  s: 'scissors',
  l: 'lizard',
  k: 'spock'
}

RPS_GAME_KEYS = {
  rock: 'scissors',
  paper: 'rock',
  scissors: 'paper'
}
LSPOCK_GAME_KEYS = {
  rock: ['scisors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors']
}

RPS_OPTIONS = ['rock', 'paper', 'scissors']
RPS_SHORTHAND_OPTIONS = ['r', 'p', 's']
LSPOCK_OPTIONS = ['rock', 'paper', 'scissors', 'lizard', 'spock']
LSPOCK_SHORTHAND_OPTIONS = ['r', 'p', 's', 'l', 'k']

results = {
  winner: nil,
  wins: 0,
  loses: 0
}

def prompt(message)
  print("\n\n=> #{message}")
end

def print_error(message)
  print("\n\n---| #{message}")
end

def get_user_name
  user_name = nil
  loop do
    prompt("Enter Player name: ")
    user_name = gets.chomp
    break if user_name != 'bot' && user_name.length > 1
    print_error("Name 'bot' is reserved for the computer. Please choose a different name...")
  end
  user_name
end

def get_game_selection
  game = nil
  loop do
    prompt("Choose game to play ('rps' for rock paper scissors, 'lsp' for lizrd spock): ")
    game = gets.chomp.downcase

    break if game =~ /^rps$/ || game =~ /^lsp$/

    print_error("Game not available. Please enter a valid game name...")
  end

  return game
end

def translate_user_choice(chosen_game, user_choice)
  case chosen_game
  when 'rps'
    RPS_SHORTHAND[user_choice.to_sym]
  when 'lsp'
    LSPOCK_SHORTHAND[user_choice.to_sym]
  end
end

def valid_user_choice?(chosen_game, user_choice)
  case chosen_game
  when 'rps'
    RPS_SHORTHAND_OPTIONS.include?(user_choice)

  when 'lsp'
    LSPOCK_SHORTHAND_OPTIONS.include?(user_choice) 

  end
end

def get_user_choice(chosen_game)
  choice = nil
  loop do
    case chosen_game
    when 'rps'
      puts "RPS Choices: 'r' = rock, 'p' = paper, 's' = scissors."
    when 'lsp'
      puts "LSP Choices: 'r' = rock, 'p' = paper, 's' = scissors, 'l' = lizard, 'k' = spock"
    end

    prompt("Enter your choice: ")
    choice = gets.chomp
    
    break if valid_user_choice?(chosen_game, choice)
  end

  return choice
end

def get_bot_choice(chosen_game)
  bot_choice = nil
  case chosen_game
  when 'rps'
    bot_choice = RPS_OPTIONS.sample
  when 'lsp'
    bot_choice = LSPOCK_OPTIONS.sample
  end
end

def play_rps(
  user_name,
  user_choice,
  bot_choice,
  past_results
)
  if user_choice == bot_choice
    puts("\n\nThis round is a Tie!")
    past_results[:winner] = 'Tie!'

  elsif RPS_GAME_KEYS[user_choice.to_sym] == bot_choice
    past_results[:wins] += 1
    past_results[:winner] = user_name

  else
    past_results[:loses] += 1
    past_results[:winner] = 'bot'

  end

  {
    winner: past_results[:winner],
    wins: past_results[:wins],
    loses: past_results[:loses]
  }
end


def play_lsp(
  user_name,
  user_choice,
  bot_choice,
  past_results
)

  if user_choice == bot_choice
    puts("\n\nThis round is a Tie!")
    past_results[:winner] = 'Tie!'

  elsif LSPOCK_GAME_KEYS[user_choice.to_sym].include?(bot_choice)
    past_results[:wins] += 1
    past_results[:winner] = user_name

  else
    past_results[:loses] += 1
    past_results[:winner] = 'bot'

  end

  {
    winner: past_results[:winner],
    wins: past_results[:wins],
    loses: past_results[:loses]
  }
end

def print_outcome_and_score(user_name, user_choice, bot_choice, results)
  puts "Winner: #{results[:winner]}!"
  puts "Score: #{results[:wins]} win(s) | #{results[:loses]} lose(s)."
  puts "#{user_name} chose: #{user_choice} | bot chose: #{bot_choice}\n\n"
end

def game_over?(game_results)
  game_results[:wins] > 5 || game_results[:loses] > 5
end

def continue_playing?
  choose_to_continue = nil
  loop do
    prompt("Continue playing? (y/n): ")
    choose_to_continue = gets.chomp
    break if choose_to_continue =~ /^y$/i || choose_to_continue =~ /^n$/i
    puts 'Error: reponse not recognized'
  end
  choose_to_continue.upcase == 'Y'
end

puts '|---- Rock Paper Scissors [Lizard Spock] Game! ----|'
user_name = get_user_name
puts "Greet user: hi #{user_name}! Let's get started..."
game_choice = get_game_selection

loop do
  user_rps_choice = get_user_choice(game_choice)
  user_rps_choice = translate_user_choice(game_choice, user_rps_choice)
  bot_rps_choice = get_bot_choice(game_choice)

  results = case game_choice
              when 'rps'
                play_rps(
                  user_name,
                  user_rps_choice,
                  bot_rps_choice,
                  results
                )
              when 'lsp'
                play_lsp(
                  user_name,
                  user_rps_choice,
                  bot_rps_choice,
                  results
                )
              end


    print_outcome_and_score(user_name, user_rps_choice, bot_rps_choice, results)

    if game_over?(results)
      puts "Game Over! Whoever has scored more than 5 won!"
      break
    end

    break unless continue_playing?
end

  puts "\nThanks for playing and hope to see you again soon!\n\n"
