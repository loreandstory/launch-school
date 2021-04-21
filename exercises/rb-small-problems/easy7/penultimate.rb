def penultimate(string)
  string.split[-2]
end

p penultimate('last word') #== 'last'
p penultimate('Launch School is great!') #== 'is'
puts


## For getting the middle word...
def middleware(string)
  words_arr = string.split
  number_words = words_arr.size
  halved_words = number_words / 2

  middle = number_words.odd? ? (-halved_words - 1) : (-halved_words-1..-halved_words)

  middle_words = if number_words <= 1
                   string
                 else
                   words_arr[middle]
                 end

  middle_words = middle_words.join(' ') if middle_words.class == Array

  middle_words.gsub(/[^a-zA-Z ]/, '') # To remove all non-alphabet characters.
end

p middleware("")
p middleware("one")
p middleware("one two")
p middleware("one two three")
p middleware("This is a longer sentence, with even numbers of words.")

