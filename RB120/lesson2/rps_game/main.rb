$LOAD_PATH << "."

require 'moves'
require 'players'
require 'game'

BOTS = [
         Computer.new,
=begin Walle.new, R2D2.new, C3PO.new,
         BB8.new,      Hal.new,   Sonny.new
=end
       ].freeze

game = Game.new
player = Human.new
computer = BOTS.sample

player.choose_move(game.type)
computer.choose_move(game.type)
game.update(player, computer)

p game.score
p game.history
p game.winner
game.print_score
