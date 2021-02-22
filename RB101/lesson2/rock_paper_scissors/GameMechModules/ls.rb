module LizardSpock
  def LizardSpock.play(user_choice, user_name, bot_name)
    game_rules = {
      rock: ['scisors', 'lizard'],
      paper: ['rock', 'spock'],
      scissors: ['paper', 'lizard'],
      lizard: ['paper', 'spock'],
      spock: ['rock', 'scissors']
    }

    number_of_options = game_rules.keys.size
    random_choice = rand(number_of_options)
    bot_choice = game_rules.keys[random_choice].to_s

    winner = if game_rules[user_choice.to_sym].include?(bot_choice)
              user_name
            elsif user_choice == bot_choice
              'Tie'
            else
              bot_name
            end

    {winner: winner, bot_choice: bot_choice}
  end
end