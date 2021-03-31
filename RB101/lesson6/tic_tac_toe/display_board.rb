module DisplayBoard

  require 'colorize'

  def self.get_term_width
    begin
      `tput cols`.chomp.to_i
    rescue
      # Unable to retrieve terminal width - set 0
      0
    end
  end

  def self.colorize_board_line(line)
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

  def self.display_board(board_arr, term_width)

    # example board_arr
    # board_arr = [
    #               [1, 2, 3]
    #               [4, 5, 6]
    #               [7, 8, 9]
    #             ]

    board_arr.each_with_index do |spot, line_number|

      filled_line = " #{spot[0]} | #{spot[1]} | #{spot[2]} "
      break_line = "-----------"

      centered_line = filled_line.center(term_width)
      line = colorize_board_line(centered_line)

      break_line = break_line.center(term_width)

      puts line
      puts break_line if line_number < 2
    end
  end

end
