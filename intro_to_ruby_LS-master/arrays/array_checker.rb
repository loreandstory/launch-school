arr = [1,3,5,7,9,11]
number = 3

def find_in_array?(arr,num)
  arr.each { |i| puts "Found!" if i == num }
end

def simple_find(arr, num)
  puts arr.include?(num)
end

a = find_in_array?(arr, number)
puts a

simple_find(arr, number)