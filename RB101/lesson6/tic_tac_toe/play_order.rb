module PlayOrder

  def self.assign_pieces(game)
    pieces = {
      # piece => number of pieces
      'X' => 5,
      'O' => 4,
    }

    possible_pieces = pieces.keys
    player_pieces = possible_pieces.sample

    possible_pieces.delete(player_pieces)
    bot_pieces = possible_pieces[0]

    game[:player] = {
                      piece: player_pieces,
                      pieces_left: pieces[player_pieces]
                    }

    game[:bot] = {
                   piece: bot_pieces,
                   pieces_left: pieces[bot_pieces]
                 }
  end

  def self.assign_current_player(game)
    
  end

end
