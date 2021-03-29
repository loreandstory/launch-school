require 'pry'

width = `tput cols`.chomp
height = `tput lines`.chomp
# size = system('stty size')

puts "Terminal size: #{height} high by #{width} wide."
