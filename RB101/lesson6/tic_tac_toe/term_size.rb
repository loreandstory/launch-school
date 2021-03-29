require 'pry'

term_width = begin
               `tput cols`.chomp.to_i
             rescue
               # Unable to retrieve terminal width 
               false
             end

# height = `tput lines`.chomp
# size = system('stty size')

puts "Terminal size: #{term_width} wide."
