print "Text: "
text = gets.chomp

print "Redact: "
redact = gets.chomp

words = text.split(" ")
redacted_text = ""

words.each do |word|
  if word == redact
    redacted_text << "redacted "
  else
    redacted_text << "#{word} "
  end
end

puts redacted_text  
