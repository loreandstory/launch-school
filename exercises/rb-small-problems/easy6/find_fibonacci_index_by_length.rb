def fibonacci_stepper(fib0, fib1)
  [fib1, fib0 + fib1]
end

def find_fibonacci_index_by_length(digits)
  # 1, 1, 2, 3, 5, 8, 13, 21, ...
  count = 1
  fib0 = 0
  fib1 = 1

  loop do
    break(count) if fib1.to_s.length == digits
    fib0, fib1 = fibonacci_stepper(fib0, fib1)
    count += 1
  end
end

p find_fibonacci_index_by_length(1) #== 1
p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847
