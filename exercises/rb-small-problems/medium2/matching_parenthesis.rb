def balanced?(string, open_char='(', close_char=')')
  parens = 0
  string.each_char do |char|
    parens += 1 if char == open_char
    parens -= 1 if char == close_char
    break if parens < 0
  end

  parens.zero?
end

def all_balanced?(string)
  balanced?(string) && balanced?(string, '[', ']') && balanced?(string, '{', '}') &&
  balanced?(string, '“', '”') && balanced?(string, '‘', '’')
end

p all_balanced?('What (is) this?') == true
p all_balanced?('What is) this?') == false
p all_balanced?('What is] this?') == false
p all_balanced?('What is} this?') == false
p all_balanced?('[((What) {(is this))}]?') == true
p all_balanced?('Hey!') == true
p all_balanced?('array.each_with_object([]) { |test| backtest }') == true
p all_balanced?('array.each_with_object([]) { |test| "backtest" }') == true
p all_balanced?('array.each_with_object([) { |test| backtest }') == false
p all_balanced?('array.each_with_object([]) { |test| backtest ') == false
p all_balanced?("He said, “I like turles”.") == true
p all_balanced?("He said, “I like turles.") == false
p all_balanced?("He said, I like turles”.") == false
p all_balanced?("He said, ‘I like turles’.") == true
p all_balanced?("“He said, ‘I like turles’.”") == true
