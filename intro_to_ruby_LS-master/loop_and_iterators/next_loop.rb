i = 0
loop do
  i += 1
  i == 6 ? break : puts("still looping")
  next
  # Next statement above jumps straight to the next loop iteration.
  # So the puts statement below never gets executed.
  puts "Please print me! You never print me!"
end

j = 0
loop do
  j += 2
  case j
  when 4 then next
  when 10 then break
  else puts j
  end
end