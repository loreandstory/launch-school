def triangle(*angles)
  return :invalid if angles.min <= 0 || angles.sum != 180 || angles.size != 3

  case angles.max
  when 90      then :right
  when (...90) then :acute
  when (90..)  then :obtuse
  else              :invalid
  end
end

p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid
