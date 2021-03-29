require 'colorize'

def color_positions(line)
  while line =~ /[^m][XO]/
    line.gsub!(/[OX]/, 'X' => 'X'.colorize(:red), 'O' => 'O'.colorize(:blue))
  end

  #while line =~ /[^m][1-9]/
  #  line.gsub!(/([1-9])/, $1.colorize(:light_white))
  #end
  
end

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

  board_arr.each_with_index do |position, line_number|

    filled_line = " #{position[0]} | #{position[1]} | #{position[2]} "
    break_line = "-----------"

    if term_width
      centered_line = filled_line.center(term_width)
      puts color_positions(centered_line)
      puts break_line.center(term_width) if line_number < 2
    else
      puts filled_line
      puts break_line if line_number < 2
    end
  end
end

display_board([['X', 2, 3], [3, 5, 'O'], [7, 8, 9]])
