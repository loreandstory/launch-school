def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
puts

# Without using the Ruby String#capitalize method...
CAP_LETTERS = ('A'..'Z').to_a
CAP_ASCII = (65..90).to_a
CAP_HASH = [CAP_ASCII, CAP_LETTERS].transpose.to_h

LOWER_LETTER_TO_CAP = 97 - 65 # i.e. ASCII code for 'a' vs one for 'A'

LOWER_LETTERS = ('a'..'z').to_a
UPPER_TO_LOWER = [CAP_LETTERS, LOWER_LETTERS].transpose.to_h
# Just to show 2 different ways of converting A <=> a


def word_cap(string)
  string.split.map do |word|
    new_first_letter =  case word[0]
                        when /[a-z]/i
                          CAP_HASH[word[0].ord - LOWER_LETTER_TO_CAP]
                        else
                          word[0]
                        end

    rest_of_word = word[1..].chars.map do |char|
                     if CAP_LETTERS.include?(char)
                       UPPER_TO_LOWER[char]
                     else
                       char
                     end
                   end.join
    
    new_first_letter + rest_of_word
  end.join(' ')
end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
