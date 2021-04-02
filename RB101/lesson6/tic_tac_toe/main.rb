$LOAD_PATH << '.'

require 'play_order.rb'
require 'game_over.rb'
require 'display_game.rb'
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
#                    pieces_left: 5,
#                    color: :blue,
#                  },
# 
#          bot:    {
#                    piece: "O",
#                    pieces_left: 4,
#                    color: :blue,
#                  },

         turn: nil,
         winner: nil
       }

PlayOrder.assign_pieces(game)

loop do
  DisplayGame.display_game(game)

  if GameOver.player_won?(game)
    game[:winner] = 'player'
    break
  elsif GameOver.bot_won?(game)
    game[:winner] = 'bot'
    break
  elsif GameOver.game_tie?(game)
    game[:winner] = 'tie'
    break
  else 

    if game[:turn] == :player
      spot_indexes = PlacePiece.get_valid_player_choice(game)
      PlacePiece.place_piece(game, spot_indexes)
    else
      BotPlay.bot_play(game)
    end

  end

  PlayOrder.toggle_turn(game)
end

DisplayGame.display_game_result(game)
