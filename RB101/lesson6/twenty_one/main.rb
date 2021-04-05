$LOAD_PATH << "."

require 'play_game.rb'

deck, player_hand, dealer_hand = PlayGame.deck_and_deal

  # def self.display_hand(hand, is_dealer = false, dealers_turn = false)
PlayGame.display_hand(player_hand)
puts
PlayGame.display_hand(['A', '10', '3'])
puts
PlayGame.display_hand(dealer_hand, true)
puts
PlayGame.display_hand(dealer_hand, true, true)
puts

