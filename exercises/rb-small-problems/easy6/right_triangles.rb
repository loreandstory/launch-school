def triangle(int, orientation='br')
  arr, align = case orientation
               when 'tl'
                 [(1..int).to_a.reverse, Proc.new { |str, val| str.ljust(val) }]
               when 'tr'
                 [(1..int).to_a.reverse, Proc.new { |str, val| str.rjust(val) }]
               when 'bl'
                 [(1..int).to_a, Proc.new { |str, val| str.ljust(val) }]
               when 'br'
                 [(1..int).to_a, Proc.new { |str, val| str.rjust(val) }]
               end

  arr.each do |num|
    puts align.call(('*' * num), int)
  end
end


triangle(3)
puts
triangle(7)
puts
triangle(9)
puts
triangle(15)
puts


puts "With different alignments..."
triangle(3, 'tr')
puts
triangle(7, 'br')
puts
triangle(9, 'tl')
puts
triangle(15, 'bl')
