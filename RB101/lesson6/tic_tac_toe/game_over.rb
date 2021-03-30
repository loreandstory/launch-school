def won_horizontally?(board_arr, piece)
  board_arr.any? do |line|
    line.all? do |position|
      position == piece
    end
  end
end

def transform_array(array)
  transformed_array = Array.new(array[0].size) { Array.new(array.size) }
 
  array.size.times do |row_num|
    array[row_num].size.times do |col_num|
      transformed_array[col_num][row_num] = array[row_num][col_num]
    end  
  end  

  transformed_array
end

def won_vertically?(board_arr, piece)
  xarray = transform_array(board_arr)

  xarray.any? do |line|
    line.all? do |position|
      position == piece
    end
  end
end

def diagonals_only(array)
  diagonals_arr = Array.new(2, [])

  # diag tr->bl a[r][c] ==> r - c == 0
  array.each_with_index do |row, row_num|
    row.each_with_index do |val, col_num|
      diagonals_arr[0] << val if row_num - col_num == 0
      p diagonals_arr
    end  
  end  

  # diag tl->br a[r][c] ==> r + c == a.size - 1
  array.each_with_index do |row, row_num|
    row.each_with_index do |val, col_num|  
      diagonals_arr[1] << val if row_num + col_num == array.size - 1    
      p diagonals_arr
    end  
  end 

  diagonals_arr
end

def won_diagonally?(board_arr, piece)
  
  board_arr.any? do |line|
    line.all? do |position|
      position == piece
    end
  end
end

def winner?(game)

  # example board_arr
  # board_arr = [
  #               [1, 2, 3]
  #               [4, 5, 6]
  #               [7, 8, 9]
  #             ]

  p won_horizontally?(game[:board], game[:player][:piece])
  p won_horizontally?(game[:board], game[:bot][:piece])
  p won_vertically?(game[:board], game[:player][:piece])
  p won_vertically?(game[:board], game[:bot][:piece])
end

game = {
         board:  [
                   ['X', 'X', 'O'],
                   [4, 'X', 'O'],
                   ['O', 'X', 'O']
                 ],

         player: {
                   piece: 'X',
                   pieces_left: 5
                 },

         bot:    {
                   piece: 'O',
                   pieces_left: 4
                 },
         
         winner: nil
       }

winner?(game)
