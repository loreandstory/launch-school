# Practice Problem 10
# 
# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
# 

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

upped_one = arr.map do |hsh|
  hsh.map do |k, val|
    val += + 1

    [k, val]
  end.to_h
end

p arr
p upped_one


# Redo, like the answer Launch School has, using each method inside instead of map + to_h
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

upped_one = arr.map do |hsh|
  temp_hsh = {}

  hsh.each do |key, val|
    temp_hsh[key] = (val +1)
  end

  temp_hsh
end

p arr
p upped_one
