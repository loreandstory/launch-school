# Did Further Exploration to remove any non-alphanumeric characters and ignore case

def leading_substrings(string)
  substring = ''

  string.chars.map do |char|
    substring += char.gsub(/[^A-Za-z0-9 ]/, ' ')
                      # ^-> remove all non-alphanumeric chars before adding to substring
  end
end

def substrings(string)
  string.chars.map.with_index do |_, index|
    leading_substrings(string[index..-1])
  end.flatten
end

def palindrome?(substring)
  downcased_substring = substring.downcase
  
  reversible = downcased_substring.reverse == downcased_substring
  not_singular = substring.length > 1
  no_extra_or_surrounding_spaces = substring.squeeze(' ').strip == substring

  reversible && not_singular && no_extra_or_surrounding_spaces
end

def palindromes(string)
  all_substrings = substrings(string)
  palindromic_substrings = []

  all_substrings.each do |substring|

    palindromic_substrings << substring if palindrome?(substring)
  end

  palindromic_substrings
end

p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
#]
p palindromes('knitting cassettes') #== [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]

p palindromes("-Racecar-")
