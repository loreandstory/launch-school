def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub_array| sub_array.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

puts

# Other solution...
def multiply_list(arr1, arr2)
  mult_arr = []
  arr1.size.times do |index|
    mult_arr << arr1[index] * arr2[index]
  end

  mult_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
