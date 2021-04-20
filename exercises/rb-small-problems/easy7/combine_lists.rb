def interleave(arr1, arr2)
  interleaved_arr = []

  arr1.each_with_index do |_, index|
    interleaved_arr << arr1[index]
    interleaved_arr << arr2[index]
  end

  interleaved_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']


# Using zip method...
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']
