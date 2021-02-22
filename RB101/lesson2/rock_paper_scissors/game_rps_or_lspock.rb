$LOAD_PATH.unshift('.')
require 'interface_module'
require 'yaml'

MESSAGES = YAML.load_file("rps_messages.yml")

PAGES = MESSAGES['pages']

game_hash = {
  quite: false,
  user_name: "Bob",
  bot_name: "bot",
  game: 'ls',
  rounds: 2,
  user_choice: "r",
  bot_choice: "r",
  winner: "Steve",
  wins: 5,
  loses: 4
}

def mock_game(game_hash)

end

InterfaceModule.display_page(
                               PAGES['greeting'],
                               game_hash,
                               '',
                               /^(|quite)$/
                            )

InterfaceModule.display_page(
                               PAGES['choose_name'],
                               game_hash,
                               :user_name,
                               {valid: /^(.+|quite)$/, invalid: /^game_hash[:bot_name]$/},
                            ) unless game_hash[:quite]

loop do
InterfaceModule.display_page(
                               PAGES['choose_game'],
                               game_hash,
                               :game,
                               /^(rps|ls|quite)$/,
                            ) unless game_hash[:quite]

InterfaceModule.display_page(
                               PAGES['choose_rounds'],
                               game_hash,
                               :rounds,
                               /^([123]|quite)$/,
                            ) unless game_hash[:quite]
  
  break if game_hash[:quite]
end
