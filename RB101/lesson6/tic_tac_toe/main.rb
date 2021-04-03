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

#  Pieces, colors, etc. assigned by PlayOrder.assign_pieces below
         player: {
#                  piece: "X",
#                  pieces_left: 5,
#                  color: :blue,
                   wins: 0,
                 },
# 
         bot:    {
#                  piece: "O",
#                  pieces_left: 4,
#                  color: :blue,
                   wins: 0,
                 },

         turn: nil,
         winner: nil,
         ties: 0,
       }

loop do
  PlayOrder.initialize_play(game)

  loop do
    DisplayGame.display_game(game)

    if GameOver.player_won?(game)
      game[:winner] = 'player'
      game[:player][:wins] += 1
      break
    elsif GameOver.bot_won?(game)
      game[:winner] = 'bot'
      game[:bot][:wins] += 1
      break
    elsif GameOver.game_tie?(game)
      game[:winner] = 'tie'
      game[:ties] += 1
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

  break unless DisplayGame.continue?
end
