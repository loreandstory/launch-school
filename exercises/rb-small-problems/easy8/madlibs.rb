def prompt_for_word(word_type)
  print "Enter a #{word_type}: "
  gets.chomp
end

def madlibs(insertable_sentence)
  noun = prompt_for_word("noun")
  verb = prompt_for_word("verb")
  adjective = prompt_for_word("adjective")
  adverb = prompt_for_word("adverb")

  words_hsh = {noun: noun, verb: verb, adjective: adjective, adverb: adverb}

  print "\n" + sprintf(insertable_sentence, words_hsh) + "\n"
end

madlibs("This %<noun>s is %<adjective>s when you %<adverb>s think about how sunshine %<verb>s.")
