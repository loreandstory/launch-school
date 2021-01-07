my_wife = {
  mind: "wonderful",
  heart: "beautiful",
  soul: "captivating"
}

p my_wife.has_key?(:soul)
p my_wife.has_value?("beautiful")
puts

p my_wife.fetch(:mind)
p my_wife.fetch(:spirit, "!")
p my_wife.fetch(:spirit) {puts "404 not found"}
p my_wife.fetch(:spirit)