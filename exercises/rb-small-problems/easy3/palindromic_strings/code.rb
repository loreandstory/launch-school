def palindrome?(string_or_array)
  string_or_array.reverse == string_or_array
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?([1, 3, 5, 6, 7]) == false
