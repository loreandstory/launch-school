def hollow_line(line)
  line.gsub(/\*{2,}/) do |match|
    '*' + (' ' * (match.size - 2)) + '*'
  end
end

def diamond(size)
  asterisks_to_print = 1
  diamond_width = size
  diamond_height = size

  puts
  1.upto(diamond_height) do |line_number|
    line =  ('*' * asterisks_to_print).center(diamond_width)
    puts hollow_line(line)

    if line_number <= diamond_height / 2
      asterisks_to_print += 2
    else
      asterisks_to_print -= 2
    end
  end
end

diamond(3)
diamond(5)
diamond(9)
