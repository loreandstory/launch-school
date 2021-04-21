def word_sizes(string)
  word_length_count = {}

  string.split.each do |word|
    if word_length_count.has_key?(word.length)
      word_length_count[word.length] += 1
    else
      word_length_count[word.length] = 1
    end
  end

  word_length_count
end

# Perhaps a better solution?
def count_word_lengths(string)
  count_hsh = {}
  word_lengths = string.split.map { |word| word.length }
  word_lengths.uniq.each { |length| count_hsh[length] = word_lengths.count(length) }
  count_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
puts
p count_word_lengths('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p count_word_lengths('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p count_word_lengths("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p count_word_lengths('') == {}
