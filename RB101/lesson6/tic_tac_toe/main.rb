$LOAD_PATH << '.'

require 'play_order.rb'
require 'game_over.rb'
require 'display_board.rb'
require 'place_piece.rb'

game = {
         board:  [
                   [1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]
                 ],

#  Assigned by PlayOrder.assign_pieces below
#          player: {
#                    piece: "X",
#                    pieces_left: 5
#                  },
# 
#          bot:    {
#                    piece: "O",
#                    pieces_left: 4
#                  },

         turn: nil,
         winner: nil
       }

PlayOrder.assign_pieces(game)
p game

loop do
  term_width = DisplayBoard.get_term_width
  DisplayBoard.display_board(game[:board], term_width)

  if GameOver.player_won?(game)
    p 'player won!'
    break
  elsif GameOver.bot_won?(game)
    p 'bot won!'
    break
  elsif GameOver.game_tie?(game)
    p 'Tie!'
    break
  else 
    spot_indexes = PlacePiece.get_valid_player_choice(game[:board])

    PlacePiece.place_piece(game[:board], spot_indexes, game[:player][:piece])
  end
end
