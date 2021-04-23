def buy_fruit(fruits_array)
  fruits_array.map do |fruit, amount|
    [fruit] * amount
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
 # ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Another version...
def buy_fruit(fruits_array)
  fruits_array.each_with_object([]) do |fruit_arr, ext_fruits_array|
    fruit, amount = fruit_arr
    ext_fruits_array.concat(Array.new(amount, fruit))
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
 # ["apples", "apples", "apples", "orange", "bananas","bananas"]
