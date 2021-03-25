# Total the age of all male members of the following family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age_total = 0

munsters.each_value do |person_hash|
  age = person_hash["age"]
  gender = person_hash["gender"]

  male_age_total += age if gender == "male"
end

p male_age_total
