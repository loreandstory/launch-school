def match_and_disable_blocks(letter, blocks_hash)
  blocks_hash.each do |block_regex, block_on|
    if letter.match?(block_regex)
      return false unless block_on
      blocks_hash[block_regex] = false
    end
  end

  true
end

def block_word?(word_string)
  t = true
  blocks_hash = {
    /b|o/i => t, /x|k/i => t, /d|q/i => t, /c|p/i => t,
    /n|a/i => t, /g|t/i => t, /r|e/i => t, /f|s/i => t,
    /j|w/i => t, /h|u/i => t, /v|i/i => t, /l|y/i => t,
    /z|m/i => t
  }

  word_string.chars.all? do |letter|
    match_and_disable_blocks(letter, blocks_hash)
  end
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true

# Simpler solution...
BLOCKS = %w(boBO xkXK dqDQ cpCP naNA gtGT reRE fsFS jwJW huHU viVI lyLY zmZM)

def block_word?(word_string)
  BLOCKS.none? { |block| word_string.count(block) > 1 }
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
