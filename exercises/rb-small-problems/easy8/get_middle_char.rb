def center_of(string)
  length = string.length

  upper_middle = length / 2
  lower_middle = if length.odd?
                   upper_middle
                 else
                   upper_middle - 1
                 end
  
  middle_range = lower_middle..upper_middle
  string[middle_range]
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') #== 'x'
