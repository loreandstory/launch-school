def print_odd_numbers(from = 1, to = 99)
  for i in from..to
    puts i if i % 2 == 0
  end
end

print_odd_numbers(1,99)

puts

# alternate way...
def alt_print_odd(from = 1, to = 99)
  puts from.upto(to).select(&:even?)
end

alt_print_odd
