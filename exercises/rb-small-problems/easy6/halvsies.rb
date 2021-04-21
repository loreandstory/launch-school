def halvsies(array)
  split_before_index = (array.size / 2.0).round(half: :up)

  first_half = array[...split_before_index]
  second_half = array[split_before_index..]

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

# Alternate solution
def halvsies(array)
  split_before_index = (array.size / 2.0).round(half: :up)
  current_index = -1 # so == 0 on first iter of partition method below.

  array.partition do |_|
    current_index += 1
    current_index < split_before_index
  end
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
