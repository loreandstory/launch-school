# using regular expressions.
# my blog post about: https://loreandstory.github.io/2021/04/08/regular-expressions-in-ruby.html)
# ruby docs on: https://docs.ruby-lang.org/en/master/Regexp.html

# def cleanup(string)
#   string.gsub(/[^a-z]+/i, " ")
# end

# Without Regexp
ALPH = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(string)
  cleaned_str = ''

  string.chars.each do |char|
    if ALPH.include?(char)
      cleaned_str << char
    else
      cleaned_str << ' '
    end
  end

  cleaned_str.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
