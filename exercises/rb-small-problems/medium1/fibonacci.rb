# # Problem
#
# Need to create a fibonacci calculator that takes in an iteration count, outputs the fibonacci number at that iteration count, and does so using recursion.
#
# To break this apart into smaller steps:
# - Take the iteration number.
# - If it is 1 or 2, not need to get into recursion - return fibonacci number is just 1 for both.
# - If the iteration number is greater than 2, recursion must be used, using the F(n) = F(n-1) + F(n - 2), which means we nust be able to calculate/find the previous two fibonacci numbers so we can add them together and then use them.
#
# Do I need to start from iterations = 5, to iter = iter -1, ...., or from the bottom working up? i.e. iter = 5, set start iter = 1, start iter = start iter + 1, ...?
#
# From the above, we know we need a recursive function with three inputs: 1) iteration count, 2) previous fibonacci number, 3) previous previous fibonacci number. i.e.:
# fibonacci(iterations, fib_minus2, fib_minus1)
#
# But, makes most sense to me to have one other input: current_iteration, so that I can start from 1 up to the given iteration number
#
# # Examples
#
# By hand, fib w/ iteration 5, i.e. fib(5) = round | fib n-2 | fib n-1 | fib n
#                                            ------|---------|---------|------
#                                              1   |    NA   |    NA   |  1
#                                              2   |    NA   |     1   |  1
#                                              3   |     1   |     1   |  2
#                                              4   |     1   |     2   |  3
#                                              5   |     2   |     3   |  5
#
# For calling the method itself: fibonnaci(iterations) => fibonacci number @ iterations,
# i.e. fibonacci(5) => 5
#
# # Data structures
# 
# No need about using arrays or hashes, but will be best to use case structure to handle case for 1-2/3+ iterations.
# 
# Otherwise, use recursion to handle falculating fib for iterations >= 3.

def fibonacci(iterations, current_iteration=1, fib_N_minus2=0, fib_N_minus1=0)
  fib_N = fib_N_minus2 + fib_N_minus1

  fib_N = 1 if current_iteration == 1

  return fib_N if current_iteration == iterations
  fibonacci(iterations, current_iteration + 1, fib_N_minus1, fib_N)
end

p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12) # == 144
p fibonacci(20) # == 6765
p fibonacci(8000)
