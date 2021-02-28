def oddities(array)
  odd_array = Array.new

  array.size.times do |iter|
    odd_array << array[iter] if iter.even?
    # .even? as .times starts from 0 and goes to array.size - 1
  end

  odd_array
end


def eventies(array)
  odd_array = Array.new

  array.size.times do |iter|
    odd_array << array[iter] if iter.odd?
    # .odd? as .times starts from 0 and goes to array.size - 1
  end

  odd_array
end

# Other ways of doing

def oddities(array)
  odd_array = []

  for odd_even in 1..array.size
    index = odd_even - 1

    odd_array.push(array[index]) if odd_even.odd?
  end

  odd_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p eventies([2, 3, 4, 5, 6]) == [3,5]
p eventies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p eventies(['abc', 'def']) == ['def']
p eventies([123]) == []
p eventies([]) == []
