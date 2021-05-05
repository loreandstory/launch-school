def longest_sentence(file_string)
  file = File.open(file_string)
  text = file.read

  sentences_arr = []
  sentence_regex = /
                     [,;'"\w\s-]+ # Match any number and order of comma,
                                  # semi-colon, single_double quotes, words and,
                                  # numbers and any dashes or whitespace
                                  # characters (new line, return, etc.)
                     [.?!]
                   /x

  sentences = text.gsub(sentence_regex) do |match|
                stripped_sentence = match.gsub(/\s+/, ' ')
                sentences_arr << stripped_sentence
                stripped_sentence
              end

  longest_sentence = sentences_arr.reduce('') do |longest, current|
                       current.length >= longest.length ? current : longest
                     end

  puts "Longest sentence from #{file_string}"
  puts "#{longest_sentence.split.length} words:\n#{longest_sentence}\n\n"
end

def longest_word(file_string)
  text = File.read(file_string)

  longest_word = ''
  text.gsub(/\b\w+\b/) do |word_match|
    longest_word = word_match if word_match.length >= longest_word.length
    word_match
  end

  puts "Longest word from #{file_string}"
  puts "#{longest_word.length} letters: #{longest_word}\n\n"
end

def longest_paragraph(file_string)
  text = File.read(file_string)

  paragraphs = text.split(/\n{2,}/)

  longest_paragraph = paragraphs.reduce({ paragraph: '', length: 0 }) do |longest, para|
                        paragraph_length = para.split(' ').length
                        if paragraph_length >= longest[:length]
                          longest[:length] = paragraph_length
                          longest[:paragraph] = para
                        end

                        longest
                      end

  puts "Longest paragraph from #{file_string}"
  puts "#{longest_paragraph[:length]} words: #{longest_paragraph[:paragraph]}\n\n"
end

longest_paragraph('gettysburg_address.txt')
longest_sentence('gettysburg_address.txt')
longest_word('gettysburg_address.txt')

puts

longest_paragraph('frankenstein.txt')
longest_sentence('frankenstein.txt')
longest_word('frankenstein.txt')
