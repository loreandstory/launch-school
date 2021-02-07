def count_occurrences(string_array)
  count_hash = Hash.new
  
  string_array.each do |string|
    lc_string = string.downcase
    unless count_hash[lc_string]
      count_hash[lc_string] = 1
    else
      count_hash[lc_string] += 1
    end
  end

  count_hash.each { |key, value| puts "#{key} => #{value}" }
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
