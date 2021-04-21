def leading_substrings(string)
  substring = ''

  string.chars.map do |char|
    substring += char
  end
end

def substrings(string)
  string.chars.map.with_index do |_, index|
    leading_substrings(string[index..-1])
  end.flatten
end

p substrings('abcde') 
#    == [
#         'a', 'ab', 'abc', 'abcd', 'abcde',
#         'b', 'bc', 'bcd', 'bcde',
#         'c', 'cd', 'cde',
#         'd', 'de',
#         'e'
#       ]
