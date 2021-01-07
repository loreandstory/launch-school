require 'pry'

def assign_names(name="Bob")
  name
end

puts assign_names
binding.pry
puts assign_names("Nancy")
