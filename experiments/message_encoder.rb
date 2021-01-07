message_to_encode = ""

while message_to_encode.empty? do
  print "Message to encode: "
  message_to_encode = gets.chomp
end

puts "\nYour message my be too obvious.\nPlease avoiding putting \'message\' in your encoded message!" if message_to_encode.downcase.include? "message"

encoded_message = message_to_encode.downcase
encoded_message.gsub!(/s/, "t")
encoded_message.gsub!(/t/, "a")
encoded_message.gsub!(/b/, "e")
encoded_message.gsub!(/a/, "r")
encoded_message.gsub(/i/, "q")
encoded_message.gsub(/e/, "g")

puts "\nEncoded Message: #{encoded_message}\n\n"

