module InterfaceModule

  def InterfaceModule.game_choices_available?(page)
    page['title'].class == Hash
  end

  def InterfaceModule.personalized_content?(content)
    content.class == String && content.match?(/^,/)
  end

  def InterfaceModule.victory_content?(content)
    content.class == Hash && content.has_key?('winner')
  end

  def InterfaceModule.score_content?(content)
      content.class == Hash && content.has_key?('wins')
  end

  def InterfaceModule.prompt_content?(content)
    content.class == String && content.match?(/^=>/)
  end

  def InterfaceModule.regex_is_hash?(input_regex)
    input_regex.class == Hash
  end

  def InterfaceModule.valid_user_input?(input, regex)
    input.match?(regex)
  end

  def InterfaceModule.display_page(
    page,
    game_hash,
    hash_key_to_change,
    user_input_regex = //
  )

    system('clear') || system('ctl')

    if game_choices_available?(page)
      puts page['title'][game_hash[:game]]
    else
      puts page['title']
    end

    page['contents'].each do |message|

      if personalized_content?(message)
        puts game_hash[:user_name] + message

      elsif victory_content?(message)
        puts game_hash[:winner] + message['winner'] + 
               "\n" + message['user_choice'] + game_hash[:user_choice] +
               "\n" + message['bot_choice'] + game_hash[:bot_choice]

      elsif score_content?(message)
        puts message['wins'] + game_hash[:wins].to_s +
               message['loses'] + game_hash[:loses].to_s

      elsif prompt_content?(message)
        print message
        
      else
        puts message
      end
    end

    user_input = nil
    loop do

      user_input = gets.chomp
      
      if regex_is_hash?(user_input_regex)
        break if (
          valid_user_input?(user_input, user_input_regex[:valid]) &&
          !valid_user_input?(user_input, user_input_regex[:invalid])
        )
      elsif valid_user_input?(user_input, user_input_regex)
        break
      else
        puts "\nSorry, I didn't understand your input or your input was not valid."
        print "=> Please try again: "
     end
    end

    if user_input == 'quite'
      game_hash[:quite] = true
    elsif game_hash.has_key?(hash_key_to_change)
      game_hash[hash_key_to_change] = user_input
    end

    game_hash
  end  
end

=begin
  display_page(PAGES['greeting'], game_hash) 
  display_page(PAGES['choose_name'], game_hash) 
  display_page(PAGES['choose_game'], game_hash) 
  display_page(PAGES['choose_rounds'], game_hash) 
  display_page(PAGES['play_rps'], game_hash) 
  display_page(PAGES['play_ls'], game_hash) 
  display_page(PAGES['round_results'], game_hash) 
  display_page(PAGES['continue'], game_hash) 
=end
