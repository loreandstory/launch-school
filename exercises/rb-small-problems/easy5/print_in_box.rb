MAX_WIDTH = 80 # characters
TEXT_PADDING = 2 #characters
END_NODES = 2 # characters

ALLOWED_STRING_WIDTH = MAX_WIDTH - TEXT_PADDING - END_NODES

def wrap_long_text(edge, padding, text)
  wrapped_lines = []
  text_array = text.split

  line_length = 0
  temp_text_line = ''

  text_array.each do |word|
    if line_length + (' ' + word).length > ALLOWED_STRING_WIDTH
      wrapped_lines << [edge, padding, temp_text_line.strip]
      temp_text_line = ''
    end

    temp_text_line += ' ' + word
    line_length = temp_text_line.strip.length
  end

  wrapped_lines << [edge, padding, temp_text_line.strip]

  wrapped_lines
end

def find_inner_box_width(string)
  if string.length > ALLOWED_STRING_WIDTH
    inner_box_width = ALLOWED_STRING_WIDTH
  else
    inner_box_width = string.length
  end
end

def print_line(edge, padding, text, inner_box_width)
  print edge + padding + text.ljust(inner_box_width, padding) + padding + edge + "\n"
end

def print_in_box(string)
  inner_box_width = find_inner_box_width(string)

  box_arr = [
    ['+', '-', ''],
    ['|', ' ', ''],
    ['|', ' ', string],
    ['|', ' ', ''],
    ['+', '-', '']
  ]

  box_arr.each do |line|
    edge, padding, text = line[0], line[1], line[2]

    if text.length > ALLOWED_STRING_WIDTH
      wrap_long_text(edge, padding, text).each do |line|
        edge, padding, text = line[0], line[1], line[2]
        print_line(edge, padding, text, inner_box_width)
      end
    else
      print_line(edge, padding, text, inner_box_width)
    end
  end
end

print_in_box("This is a test")
print_in_box("")
print_in_box("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
