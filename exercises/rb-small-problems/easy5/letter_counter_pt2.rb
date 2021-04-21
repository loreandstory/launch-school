def cleanup(string)
  string.delete('^A-z ').strip
end

def word_sizes(string)
  cleaned_string = cleanup(string)
  word_lengths = cleaned_string.split.map { |word| word.length }

  word_lengths.uniq.each_with_object({}) do |length, hash| 
    hash[length] = word_lengths.count(length)
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')  == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
