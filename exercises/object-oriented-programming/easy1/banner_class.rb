module MakeBanner
  private

  def make_line(edges_char='+', fill_char='-', content='')
    border = edges_char + fill_char
    border + content.center(@content_width, fill_char) + border.reverse
  end

  def horizontal_rule
    make_line
  end

  def empty_line
    make_line('|', ' ')
  end

  def message_line
    make_line('|', ' ', @message)
  end
end

class Banner
  MIN_MESSAGE_PADDING = 2 # For padding on both sides of message
  BORDERS_WIDTH = 2 # total width of borders (left and right sides)
  TOTAL_MARGINS_WIDTH = MIN_MESSAGE_PADDING + BORDERS_WIDTH
  MAX_BANNER_WIDTH = 80 # columns

  include MakeBanner

  def initialize(message, banner_width=message.size+TOTAL_MARGINS_WIDTH)
    @banner_width = if banner_width > MAX_BANNER_WIDTH
                      MAX_BANNER_WIDTH
                    elsif banner_width < TOTAL_MARGINS_WIDTH
                      TOTAL_MARGINS_WIDTH
                    else
                      banner_width
                    end

    @content_width = @banner_width - TOTAL_MARGINS_WIDTH
    @message = message[0, @content_width]
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('Programming in OOP is fun!', 5)
puts banner

banner = Banner.new('Programming in OOP is fun!', 60)
puts banner

banner = Banner.new('Programming in OOP is fun!', 80)
puts banner

banner = Banner.new('Programming in OOP is fun!', 1205)
puts banner
