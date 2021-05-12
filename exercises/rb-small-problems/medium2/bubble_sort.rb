TO_COMPARE = 2

def bubble_sort!(array)
  index = 0
  max_index = array.size - TO_COMPARE
  swap_occurred = false

  loop do
    value1, value2 = array[index, TO_COMPARE]

    if value1 > value2
      array[index, TO_COMPARE] = array[index, TO_COMPARE].reverse
      swap_occurred = true
    end

    if swap_occurred == false && index == max_index
      break
    elsif index == max_index
      swap_occurred = false
      max_index -= 1 if index > 0 # As each round through brings the (round#)st/th/rd/teenth
                                  # greatest value to the (round#)st/th/rd/teenth end of the
                                  # array, and this value does not need to be compared with any
                                  # of the lower numbers still present in the rest of the array.
      index = 0
    else
      index += 1
    end
  end
end

p array = [5, 3]
p bubble_sort!(array)
p array #== [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array #== [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
