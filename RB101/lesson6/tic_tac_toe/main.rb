$LOAD_PATH << '.'

require 'play_order.rb'
require 'game_over.rb'
require 'display_board.rb'
require 'place_piece.rb'
require 'bot_play.rb'

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

loop do
  term_width = DisplayBoard.get_term_width
  DisplayBoard.display_board(game[:board], term_width)
  p game

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
    if game[:turn] == :player
      spot_indexes = PlacePiece.get_valid_player_choice(game[:board])
      PlacePiece.place_piece(game, spot_indexes)
    else
      BotPlay.bot_play(game)
    end
  end

  PlayOrder.toggle_turn(game)
end
