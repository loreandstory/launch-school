def multiply(num1, num2)
  num1 * num2
end

def square(int)
  multiply(int, int)
end

def power_n(number, power)
  (1..power + 1).reduce { |sum| sum * number }
end

p square(5) == 25
p square(-8) == 64

p power_n(5, 3) == 125
p power_n(2, 5) == 32
