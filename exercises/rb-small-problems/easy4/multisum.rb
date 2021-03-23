def multisum(end_number)
  (1..end_number).reduce(0) do |sum, number|
    (number % 3 == 0) || (number % 5 == 0) ? sum + number : sum
  end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
