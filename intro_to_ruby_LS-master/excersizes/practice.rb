num_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts "print out array..."
num_array.each { |num| puts num }

puts "select values > 5 and print..."
num_array.select { |num| num > 5 }.each { |num| puts num }

puts "select odd numbers and print..."
num_array.select { |num| num % 2 != 0 }.each { |num| puts num }

puts "appending 11 to end of array..."
 p num_array.push(11)

 puts "preppending 0 to beginning of array..."
 p num_array.unshift(0)

 puts "get rid of 11 and append 3..."
 p num_array.pop
 p num_array << 3

 puts "get rid of duplicates without specifically removing and one value..."
 p num_array.uniq!

 puts "create a single key hash using both Ruby sytax styles..."
 my_hash = {symbol: "value"}
 og_hash_syntax = {:symbol => "value"}

 puts "playing with hashes..."
 h = {a: 1, b: 2, c: 3, d: 4}
 p h[:b]
 h[:e] = 5
 p h
 p h.select { |key, val| val >= 3.5 }
 p h.delete_if { |key, val| val < 3.5 }

 puts
 puts "using data from array in hash..."
 contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
p contacts

puts
puts "accessing hash values..."
p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

puts
puts "delete words that begin with..."
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s", "w") }
p arr

puts
puts "split and filter and flatten array..."
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! { |phrase| phrase.split }
p a.flatten!

puts
puts "array and hash looping..."
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
data_tags = [:email, :address, :phone]

loop do
  contacts[data_tags.shift] = contact_data.shift
  break if !contact_data.first
end

p contacts
p contact_data
p data_tags



contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  p idx
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

p contacts