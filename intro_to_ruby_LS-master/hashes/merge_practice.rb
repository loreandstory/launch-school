hash1 = Hash.new(0)
hash1[:a] = 10
hash1[:b] = 12
p hash1
puts

hash2 = Hash.new(0)
hash2[:c] = 3
hash2[:b] = 394
p hash2
puts

merged = hash1.merge(hash2)
p merged
p hash1
p hash2
puts

hash1.merge!(hash2) {|key, val1, val2| val2 - val1}
p hash1
p hash2