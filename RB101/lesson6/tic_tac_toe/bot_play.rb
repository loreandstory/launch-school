module BotPlay

  $LOAD_PATH << '.'

  require 'game_over.rb'
  require 'place_piece.rb'

  def self.board_empty?(board_arr)
    flattened_array = board_arr.flatten

    flattened_array.all? do |spot|
      spot.to_s =~ /[1-9]/
    end
  end

  def self.randomly_place_piece(game)
      spot_to_play = [rand(0..2), rand(0..2)]
      PlacePiece.place_piece(game, spot_to_play)
  end

  def self.find_empty_spots(board_arr)
    flattened_array = board_arr.flatten

    flattened_array.select do |spot|
      spot.class == Integer
    end
  end

  def self.one_spot_left?(board_arr)
    empty_spots = find_empty_spots(board_arr)

    empty_spots.size == 1
  end

  def self.place_piece_final_spot(game)
    empty_spot = find_empty_spots(game[:board])[0]
    final_spot_index = PlacePiece.find_spot_index(game[:board], empty_spot)

    PlacePiece.place_piece(game, final_spot_index)
  end

  def self.play_to_win(game)
    empty_spots = find_empty_spots(game[:board])
    cloned_board = game[:board].clone


  end

  def self.bot_play(game)
    test_board = game[:board].dup

    if board_empty?(game)
      randomly_place_piece(game)
    elsif one_spot_left?(game[:board])
      place_piece_final_spot(game)
    else
    end

  end

end
