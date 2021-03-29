require 'colorize'

def try_center_line(line, term_width)
  if term_width != false
    line.center(term_width)
  else
    line
  end
end

def colorize_board_line(line)
  line.chars.map do |char|
    if char == 'X'
      char.colorize(:red)
    elsif char == 'O'
      char.colorize(:blue)
    elsif char =~ /[1-9]/
      char.colorize(:light_white)
    else
      char
    end
  end.join('')
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

    centered_line = try_center_line(filled_line, term_width)
    line = colorize_board_line(centered_line)

    break_line = try_center_line(break_line, term_width)

    puts line
    puts break_line if line_number < 2
  end
end

display_board([['X', 2, 3], [3, 5, 'O'], [7, 8, 9]])
