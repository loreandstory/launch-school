def sort_shorter_longer(str1, str2)
  return [str2, str1] if str1.length > str2.length
  return [str1, str2] if str2.length > str1.length
end

def short_long_short_concatenator(short_str, long_str)
  short_str + long_str + short_str
end

def short_long_short(given_str1, given_str2)
  shorter, longer = sort_shorter_longer(given_str1, given_str2)
  short_long_short_concatenator(shorter, longer)
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
