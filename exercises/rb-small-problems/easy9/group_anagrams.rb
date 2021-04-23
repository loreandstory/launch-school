def alphabetize_word_letters(word)
  word.chars.sort.join
end

def find_anagrams_hash(words_array)
  words_array.group_by { |word| alphabetize_word_letters(word) }
end

def print_anagrams(words_array)
  anagrams_hash = find_anagrams_hash(words_array)

  anagrams_hash.each_value do |words_list|
    p words_list if words_list.size > 1
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)


