=begin def fibonacci(num1, num2, it_count)
  puts num1
  if it_count > 0
    holder = num2
    num2 += num1
    num1 = holder
    fibonacci(num1, num2, it_count-1)
  end
end
=end

# fibonacci(0,1,10)


def simple_fib(num)
  if num  < 2
    num
  else
    simple_fib(num - 1) + simple_fib(num - 2)
  end
end

puts simple_fib(5)