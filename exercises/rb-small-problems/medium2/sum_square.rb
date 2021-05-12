def sum_square_difference(integer)
  sum = 1.upto(integer).sum
  squares_array = 1.upto(integer).map { |int| int**2 }

  sum**2 - squares_array.sum
end

p sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
