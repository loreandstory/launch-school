def rotate_array(array)
  array[1..] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
p rotate_array(['a']) #== ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) #== [2, 3, 4, 1]   # => true
p x #== [1, 2, 3, 4]                 # => true

# Rotating string
def rotate_string(string)
  string_array = string.chars
  rotate_array(string_array).join
end

# Rotating integers
def rotate_integer(integer)
  stringified_number = integer.to_s
  rotate_string(stringified_number).to_i
end

p rotate_string('t')
p rotate_string('this')

p rotate_integer(0)
p rotate_integer(1234)
