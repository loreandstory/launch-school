require 'colorize'

def display_board(board_arr)

  # example board_arr
  # board_arr = [
  #               [1, 2, 3]
  #               [4, 5, 6]
  #               [7, 8, 9]
  #             ]
  
  term_width = begin
                 `tput cols`.chomp.to_i
               rescue
                 # Unable to retrieve terminal width
                 false
               end

  board_arr.each_with_index do |board_line, line_number|
    #
    # Board:
    #   line 0:   |   |   
    #   break1:-----------
    #   line 1:   |   |   
    #   break2:-----------
    #   line 2:   |   |   

    pos = []
    board_line.each do |entry|
      if entry.class == String
        pos << entry.colorize(:red) if entry == "X"
        pos << entry.colorize(:blue) if entry == "O"
      elsif entry.class == Integer
        pos << entry.to_s.colorize(:light_white)
      else
        pos << " "
      end
    end

    filled_line = " #{pos[0]} | #{pos[1]} | #{pos[2]} "
    break_line = "-----------"

    if term_width
      puts filled_line.center(term_width)
      puts break_line.center(term_width) if line_number < 2
    else
      puts filled_line
      puts break_line if line_number < 2
    end
  end
end

display_board([['X', 2, 3], [3, 5, 'O'], [7, 8, 9]])
