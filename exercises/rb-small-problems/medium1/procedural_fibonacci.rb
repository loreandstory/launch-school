# # Problem
#
# Create a method that returns the fibonacci number for the provided integer `iterations`, without using recursion and instead relying on procedural means.
#
# Again, the fibonacci sequence goes like this:
# 
#   iteration | fib n-2 | fib n-1 | fib n
#   ----------|---------|---------|------
#        1    |    na   |    na   |   1
#        2    |    na   |     1   |   1
#        3    |     1   |     1   |   2
#        4    |     1   |     2   |   3
#        5    |     2   |     3   |   5
#
# A procedural method should execute the above seuence without any need for recursion.
#
# # Data Structures
#
# Could use an array. Hash would likely not be as good a choice. But I believe the most efficient way is to have two variables: fib_N and fib_N_minus1 to keep track of values, where fib_N would be the latest number, but also used as a placeholder for the next to latest number until the latest can be recalculated.
#
# The same with fib_N_minus1, where it can also be used as a placeholder for the next next last number (what would be fib_N_minus2).
#
# (EDIT - will need to have variable fib_N_minus2 in place, as cannot kepp track of fibonacci series values with just 2 variables!)
#
# (EDIT2 - can use just two variables, but will have to use Ruby's syntaticcal sugar of val1, val2, = val2, val1 + val2. For algorithm's psuedo code, did use three variables to keep track of).
#
# I will be using an iteration method, namely 1.upto(iterations), so that I get the range of values from 1..iterations, knowing it will stop iterating on value iterations.
#
# # Algorithm
#
# START
# GIVEN `iterations` => integer of fibonacci sequence index to stop at and then return value.
# SET integer value `fib_N = 1`
# SET integer value `fib_N_minus1 = 0`
# SET integer value `fib_N_minus2 = 0`
# FOR iteration within the integer 1 to the integer value of `iterations`, do the following:
#   > fib_N = fib_N_minus1 = fib_N_minus2
#   > fib_N = 1 if iteration == 1
#   > fib_N_minus2 = fib_N_minus1
#   > fib_N_minus1 = fib_N
# RETURN fib_N
# END

def fibonacci(iterations)
  fib_N = 0
  fib_N_minus1 = 0

  1.upto(iterations) do |iteration|
    fib_N_minus1, fib_N = [fib_N, fib_N_minus1 + fib_N]

    fib_N = 1 if iteration == 1 # This kicks off the fibonacci sequence. Otherwise, starts
                                # off one iteration ahead if fib_N = 1 before `upto` method.
  end

  fib_N
end

def fibonacci_last(iterations)
  fib_arr = [1, 1]

  3.upto(iterations) do |iteration|
    fib_arr = [fib_arr.last, (fib_arr.first + fib_arr.last) % 10]
  end

  fib_arr.last
end

# p fibonacci(20) #== 6765
# p fibonacci(100) #== 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
# puts
# puts

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
