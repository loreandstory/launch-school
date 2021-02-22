module RockPaperScissors
  def RockPaperScissors.play(user_choice, user_name, bot_name)
    game_rules = {
      rock: 'scissors',
      paper: 'rock',
      scissors: 'paper'
    }

    number_of_options = game_rules.values.size
    random_choice = rand(number_of_options)
    bot_choice = game_rules.values[random_choice]

    winner = if game_rules[user_choice.to_sym] == bot_choice
              user_name
            elsif user_choice == bot_choice
              'Tie'
            else
              bot_name
            end

    {winner: winner, bot_choice: bot_choice}
  end
end