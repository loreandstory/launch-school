def count_chars(string)
  string_no_spaces = string.gsub(' ', '')
  string_no_spaces.length
end

def count_words(string)
  match_punctuation_regex = /[ !\?,\.:;'"\(\)\{\}\[\]\@#$%^&\*_\+=]/
  no_punctuation_stringarray = string.split(match_punctuation_regex)
                                 .delete_if { |element| element == "" }

  no_punctuation_stringarray.size
end

def count_chars_words
  print "Please enter a word or words: "
  user_input = gets.chomp
  
  num_char = count_chars(user_input)
  num_words = count_words(user_input)

  print "\nThere are #{num_char} characters and #{num_words} words in: #{user_input}\n"
end

count_chars_words
