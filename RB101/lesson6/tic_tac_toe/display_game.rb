module DisplayGame

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

  def self.colorize_line(line, to_color_regex, color)
    line.gsub(to_color_regex, '\1'.colorize(color))
  end


  def self.center_and_colorize_line(line, to_color_regex, color)
    term_width = get_term_width
    centered_line = line.center(term_width)
    centered_line.gsub(to_color_regex, '\1'.colorize(color))
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

  def self.display_title_line(color_tic, color_tac, color_toe, term_width)
    title = "Tic Tac Toe"
    centered_title = title.center(term_width)
    color_title =
      centered_title.gsub(
        /(Tic).*(Tac).*(Toe)/, 
        '\1'.colorize(color_tic) + ' ' + '\2'.colorize(color_tac) + ' ' + '\3'.colorize(color_toe)
      )

    print "#{color_title}\n\n"
  end

  def self.display_game(game)
    term_width = get_term_width

    display_title_line(:red, :blue, :light_white, term_width)
    display_board(game[:board], term_width)
    puts
    break_line = "---------------------"
    puts break_line.center(term_width)
    puts
    if game[:turn] == :player
      player_line = "player's turn"
      centered_player_line player_line.center(term_width)
      if game[:player][:piece] == 'X'
        puts player_line.replace("player", "player".colorize(:red)
      elsif game[:player][:piece] == 'O'
        puts player_line.replace("player", "player".colorize(:blue)
      end
    else
      player_line = "bot's turn"
      centered_player_line player_line.center(term_width)
      if game[:bot][:piece] == 'X'
        puts player_line.replace("bot", "bot".colorize(:red)
      elsif game[:bot][:piece] == 'O'
        puts player_line.replace("bot", "bot".colorize(:blue)
      end
    end

      sleep(2)
  end

end
