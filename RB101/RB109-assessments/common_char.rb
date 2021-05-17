# # Overview
#
# Create constant variable in the main scope called `ALPH`, which will point to an array of each leetter (string) in the alphabet, in order.
#
# Want to take each string element in `strings_array`, break each down into characters that can then be sorted alphabetically.
# Initilize a new variable within the method called `common_chars_found` and point to new empty array object.
# Then, iterate through the `ALPH`, checking if each letter of the alphabet is present in each string in the `string_array`, and how many times.
#   - If a letter is present at least n >= 1 times for every string in `strings_array`, then push n elements of that letter of the alphabet from the constant `ALPH` to the variable `common_chars_found`
#   - Create a variable inside the iteration for the ALPHABET, called `least_found` and assign the value 0 to it.
#   - As we iteratate through the strings_array's strings, we can keep track of the least amount of that character found wihin the array, so we know how many to actually push to our new array `common_chars_found`.
# Return oject that the variable `common_chars_found` points to.
# DONE

ALPHABET = ('a'..'z').to_a.freeze

def common_chars(strings_array)
  common_chars_found = []

  ALPHABET.each do |letter|
    letters_found = []

    strings_array.each do |string|
      letters_found << string.count(letter)
    end

    least_found_in_strings = letters_found.sort[0]
    least_found_in_strings.times do |_|
      common_chars_found << letter
    end
  end

  common_chars_found
end

p common_chars(['test', 'thought', 'fightt'])
p common_chars(['aabbarc', 'abracadabra', 'albright-care'])
