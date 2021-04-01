module BotPlay

  $LOAD_PATH << '.'

  require 'game_over.rb'
  require 'place_piece.rb'
  require 'pry'

  def self.board_empty?(board_arr)
    flattened_array = board_arr.flatten

    flattened_array.all? do |spot|
      spot.to_s =~ /[1-9]/
    end
  end

  def self.board_empty_randomly_place_piece(game)
    spot_to_play = [rand(0..2), rand(0..2)]
    PlacePiece.place_piece(game, spot_to_play)
  end

  def self.find_empty_spot_values(board_arr)
    flattened_array = board_arr.flatten

    flattened_array.select do |spot|
      spot.class == Integer
    end
  end

  def self.one_spot_left?(board_arr)
    empty_spots_values = find_empty_spot_values(board_arr)

    empty_spots_values.size == 1
  end

  def self.place_piece_final_spot(game)
    empty_spot_value = find_empty_spot_values(game[:board])[0]
    final_spot_index = PlacePiece.find_spot_index(game[:board], empty_spot_value)

    PlacePiece.place_piece(game, final_spot_index)
  end

  def self.duplicate_game(game)
    dup_board = []
    game[:board].each do |row|
      dup_board << row.dup
    end
    
    {
      board: dup_board, 
      player: game[:player].dup,
      bot: game[:bot].dup,
      turn: game[:turn],
      winner: game[:winner]
    }.dup
  end

  def self.play_to_win_returnindexes(game)
    empty_spots_values = find_empty_spot_values(game[:board])
    spot_indexes = [nil, nil]

    empty_spots_values.each do |value|
      dup_game = duplicate_game(game)

      selected_index = PlacePiece.find_spot_index(dup_game[:board], value)
      PlacePiece.place_piece(dup_game, selected_index)

      if GameOver.bot_won?(dup_game)
        spot_indexes = selected_index
        break
      end
    end

    spot_indexes
  end

  def self.avoid_losing_returnindexes(game)
    empty_spots_values = find_empty_spot_values(game[:board])
    spot_indexes = [nil, nil]

    empty_spots_values.each do |value|
      dup_game = duplicate_game(game)
      dup_game[:turn] = :player

      selected_index = PlacePiece.find_spot_index(dup_game[:board], value)
      PlacePiece.place_piece(dup_game, selected_index)

      if GameOver.player_won?(dup_game)
        spot_indexes = selected_index
        break
      end
    end

    spot_indexes
  end

  def self.randomly_place_piece(game)
    empty_spots_values = find_empty_spot_values(game[:board])
    randomly_chosen_val = empty_spots_values.sample

    chosen_index = PlacePiece.find_spot_index(game[:board], randomly_chosen_val)
    PlacePiece.place_piece(game, chosen_index)
  end

  def self.bot_ai_place_piece(game)
    will_win_indexes = play_to_win_returnindexes(game)
    avoid_losing_indexes = avoid_losing_returnindexes(game)

    if will_win_indexes[0] != nil && will_win_indexes[1] != nil
      PlacePiece.place_piece(game, will_win_indexes)
    elsif avoid_losing_indexes[0] != nil && avoid_losing_indexes[1] != nil
      PlacePiece.place_piece(game, avoid_losing_indexes)
    else
      randomly_place_piece(game)
    end
  end

  def self.bot_play(game)
    test_board = game[:board].dup

    if board_empty?(game)
      board_empty_randomly_place_piece(game)
    elsif one_spot_left?(game[:board])
      place_piece_final_spot(game)
    else
      bot_ai_place_piece(game)
    end
  end

end
