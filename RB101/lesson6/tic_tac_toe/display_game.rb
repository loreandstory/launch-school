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

  def self.center_line(line)
    term_width = get_term_width
    line.center(term_width)
  end


  def self.color_line(line, to_color_regex, color_sym)
    line.gsub(to_color_regex) do |match|
      match.colorize(color_sym)
    end
  end

  def self.prepare_line(game, line)

    color_hsh = {
      /\d/ => :light_white,
      /player/ => game[:player][:color],
      /bot/ => game[:bot][:color],
      /Tic/ => :red,
      /Tac/ => :blue,
      /Toe/ => :light_white,
      /X/ => :red,
      /O/ => :blue,
    }

    cline = center_line(line)

    colorized_line = cline
    color_hsh.each do |regex, color|
      # puts "#{colorized_line}:  #{regex}  #{color}  : #{color_line(colorized_line, regex, color)}"
      colorized_line = color_line(colorized_line, regex, color)
    end

    colorized_line
  end

  def self.display_board(game)

    # example game board
    # game[:board] = [
    #                  [1, 2, 3]
    #                  [4, 5, 6]
    #                  [7, 8, 9]
    #                ]

    game[:board].each_with_index do |spot, line_number|

      filled_line = " #{spot[0]} | #{spot[1]} | #{spot[2]} "
      break_line = "-----------"

      line = prepare_line(game, filled_line)

      break_line = prepare_line(game, break_line)

      puts line
      puts break_line if line_number < 2
    end
  end

  def self.display_game(game)
    sleep(1)

    system('clear')

    print "\n\n\n\n"
    puts prepare_line(game, "Tic Tac Toe")
    puts
    display_board(game)
    puts
    puts prepare_line(game, "turn: #{game[:turn]}")
    puts
    puts prepare_line(game, "----------------------------------")
    puts
    puts prepare_line(game, "player              bot           ")
    puts prepare_line(game, "piece: #{game[:player][:piece]}            piece: #{game[:bot][:piece]}     ")
    puts prepare_line(game, "piece left: #{game[:player][:pieces_left]}       pieces left: #{game[:bot][:pieces_left]}")
    puts prepare_line(game, "wins: #{game[:player][:wins]}             wins: #{game[:bot][:wins]}      ")
    puts prepare_line(game, "ties: #{game[:ties]}                           ")
    puts

  end

  def self.display_game_result(game)
    result = if game[:winner] != 'tie'
               ' won!'
             else
               '!'
             end

    longest_return = "player won!".length
    result_declaration = game[:winner] + result
    
    puts
    puts prepare_line(game, "##################################")
    puts prepare_line(game, "##          #{result_declaration.center(longest_return)}         ##")
    puts prepare_line(game, "##################################")
    puts
  end

  def self.continue?
    yes = ['y', 'Y', 'yes', 'continue']
    no = ['n', 'N', 'no', 'quit', 'exit']

    continue = false

    loop do
      print "=> Play another round? (y/n): "
      user_input = gets.chomp

      if yes.include?(user_input)
        continue = true
        break
      elsif no.include?(user_input)
        continue = false
        break
      else
        print "Not a valid input. Please try again...\n\n"
      end
    end

    continue
  end

end
