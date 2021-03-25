# Print the info for each family memeber below like so:
# 
#   (Name) is a (age)-year-old (male or female).
#

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person, details_hsh|
  age = details_hsh["age"]
  gender = details_hsh["gender"]

  puts "#{person} is a #{age}-year-old #{gender}."
end
