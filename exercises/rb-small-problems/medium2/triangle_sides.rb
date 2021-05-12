def not_three_sided?(arr)
  sides = arr.size
  sides != 3
end

def invalid_length_values?(arr)
  arr.any? { |value| value.class != Integer && value.class != Float }
end

def any_sides_length_zero?(arr)
  arr.any?(0)
end

def side_lengths_invalid?(arr)
  sorted_side_lengths = arr.sort
  
  lesser_sides = sorted_side_lengths[0, 2]
  longest_side = sorted_side_lengths.last

  lesser_sides.sum <= longest_side
end

def number_most_repeated(arr)
  repeat_hash = arr.each_with_object(Hash.new(0)) do |value, repeat_hash|
                  repeat_hash[value] += 1
                end

  repeat_hash.values.max
end

def triangle(*triangle)
  error = if not_three_sided?(triangle)
            "Please input exactly three sides."
          elsif invalid_length_values?(triangle)
            "All side values must be integer or floats numbers."
          elsif any_sides_length_zero?(triangle)
            "None of the sides can be of length zero."
          elsif side_lengths_invalid?(triangle)
            "The sum of the two shorter sides must be greater than the largest\
 side to be a valid triangle."
          else
            nil
          end

  if error !=nil
    puts "\n=> " + error
    :invalid
  else
    case number_most_repeated(triangle)
    when 3 then :equilateral
    when 2 then :isosceles
    when 1 then :scalene
    else        :invalid
    end
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
