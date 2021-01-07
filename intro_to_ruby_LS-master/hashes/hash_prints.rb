my_wife = {
  mind: "wonderful",
  heart: "beautiful",
  soul: "captivating"
}

my_wife.keys.each {|key| puts key}
my_wife.values.each {|val| puts val}
my_wife.each {|key, val| puts "My wife's #{key} is #{val}"}

my_wife.each_key {|key| puts key}
my_wife.each_value {|val| puts val}
my_wife.each {|key, val| puts "My wife's #{key} is #{val}"}