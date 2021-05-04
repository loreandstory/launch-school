# # Design
#
# ## Problem
# 
# Design a method that takes a sentence **string as input** and **returns the *same* string with: all words for numbers transformed to the actual numbers, spaces between *transformed* numbers removed, and any phone numbers converted to format (xxx) xxx-xxxx**.
#
#
# ### Inputs
#
# - string sentence containing numbers as words.
#
# ### Outputs
#
# - Same string sentence w/ word numbers -> combined (as needed) and transformed (as needed) number numbers.
#
# ## Examples
#
# > 'Could you please call me at one two three four five six seven eight nine zero, using extension 12 45?'
# >   -> 'Could you please call me at (123) 456 7890, using extension 12 45?'
#
# ## Data Structures
#
# - Create a constant INTEGERS hash that has number names as keys and number values as values. Use to match number names in string.
# - As input string and output string must be the same string, we will be *mutating* the string. It must remain a string (not be transformed) and must be mutated only. i.e. string (object ID 555) => integers_subbed_string (object ID 555).
#
# ## Algorithm
# 
# The program could accomplish its task by...
# 1. Taking the input string.
# 2. Using Regexp to capture each whole string of word numbers, then mutating the whole way...
#      a. Take this whole string of word numbers and replace the word numbers with numbers...
#      b. Take the whole string of word numbers again, remove all spaces...
#      c. Take the whole string of word numbers again, check if have 10 numbers, replace with properly formatted phone # (xxx) xxx-xxxx
#      d. Return mutated whole string of numbers to original, mutating regex/method to replace the whole word number string in the original string and return the now mutated original string.

INTEGERS = {
  'one' =>   '1', 'two' =>   '2', 'three' => '3',
  'four' =>  '4', 'five' =>  '5', 'six' =>   '6',
  'seven' => '7', 'eight' => '8', 'nine' =>  '9',
  'zero'  => '0'
}.freeze

def word_to_digit(string)
  potential_matches = 'one|two|three|four|five|six|seven|eight|nine|zero'
  catch_wordnums_regex = /(          # Start regex and capture group
    \b                               # Capure must start with word boundary
    (#{potential_matches})           # Use 'potential_matches' to add alternation so any word name will match
    \b                               # Capture must end with word boundary
    (\s(?=(#{potential_matches})))?  # Include space after only if the next word is also a number word (and both space and next number word are present)
    )+                               # End capture group, + denoting that 1 number word or a whole string of them may be matched at once
  /xi                                # end regex, xi at end allows (x) having this regex on multiple lines w/ comments and (i) ignoring case: T vs t, etc.


  string.gsub!(catch_wordnums_regex) do |number_words_section|
    number_words_section.gsub!(/(#{potential_matches})/i) { |number_match| INTEGERS[number_match.downcase] }
    number_words_section.gsub!(/\s/, '')
    number_words_section.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) ' + '\2-' + '\3')

    number_words_section
  end
end

p string = 'Please call me at five five five one two Three four. Thanks.'
p string.object_id
p word_to_digit(string) #== 'Please call me at 2 2 2 5 5 5 1 2 3 4. Thanks.'
p string
p string.object_id
puts

p string = 'Please call me at two two two five five five one two three four at one two. Thanks.'
p string.object_id
p word_to_digit(string) #== 'Please call me at 2 2 2 5 5 5 1 2 3 4. Thanks.'
p string
p string.object_id
puts

p string = "Could you please call me at one two three four five six seven eight nine zero, using extension 12 45?"
p string.object_id
p word_to_digit(string)
p string
p string.object_id
puts
