def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    value_to_print = if num % 3 ==0 && num % 5 == 0
                       "FizzBuzz"
                     elsif num % 5 == 0
                       "Buzz"
                     elsif num % 3 ==0
                       "Fizz"
                     else
                       num.to_s
                     end
    value_to_print += ", " unless num == end_num
    print value_to_print
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
