module PlayGame
  $LOAD_PATH << '.'

  require 'handle_cards'
  require 'colorize'

  def self.deck_and_deal
    deck = HandleCards.make_and_shuffle_deck

    player_hand = [deck.pop, deck.pop]
    dealer_hand = [deck.pop, deck.pop]

    [deck, HandleCards.sort_hand(player_hand), dealer_hand]
  end

  def self.color_new_card(hand, new_card_color)
    hand[0..-2] << hand.last.colorize(new_card_color)
  end

  def self.display_cards(hand)
    hand.each do |card|
      print " | #{card} | "
    end
  end

  def self.hide_dealers_2nd_card(dealers_hand)
    dup_hand = dealers_hand.dup
    dup_hand[-1] = '?'

    dup_hand
  end

  def self.display_hand(hand, is_dealer = false, dealers_turn = false)
    if is_dealer && !dealers_turn
      printable_hand = hide_dealers_2nd_card(hand)
    elsif is_dealer && dealers_turn
      printable_hand = color_new_card(hand, :red)
    elsif hand.size > 2 && !is_dealer
      colorized_hand = color_new_card(hand, :blue)
      printable_hand = HandleCards.sort_hand(colorized_hand)
    else
      printable_hand = hand
    end

    display_cards(printable_hand)
  end

  #   p deck
  #   p deck.size
  #   puts
  #
  #   p HandleCards.sort_hand(deck)
  #   puts
  #   p deck
  #   puts
  #   p HandleCards.sum_hand_value(HandleCards.sort_hand(deck))
end
