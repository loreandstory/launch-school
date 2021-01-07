numbers_array = [1,2,3,4,5]

doubled_array = numbers_array.collect { |num| num + 2 }

# OR....
shoveled_array = []
numbers_array.each { |num| shoveled_array << num + 2 }

puts doubled_array
puts shoveled_array