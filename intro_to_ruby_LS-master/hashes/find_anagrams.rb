words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

  
def find_anagrams_in_array(words_array)
  anagrams_hash = {}
  words_array.each do |word|
    key = word.split("").sort.join
    anagrams_hash[key] = [] unless anagrams_hash.has_key?(key)
    anagrams_hash[key].push(word)
  end

  p anagrams_hash
end

find_anagrams_in_array(words)