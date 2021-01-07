def countdown(n)
  puts n
  countdown(n - 1) unless n <= 0
end


countdown(10)
puts ""
countdown(-10)