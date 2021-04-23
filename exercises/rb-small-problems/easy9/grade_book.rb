def get_grade(*grades)
  final_grade = grades.sum / grades.size

  case final_grade
  when 101..   then 'A+'
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(105, 98, 110) #== "A+"
p get_grade(95, 90, 93) #== "A"
p get_grade(80, 90, 93) #== "B"
p get_grade(80, 70, 75) #== "C"
p get_grade(50, 50, 95) #== "D"
p get_grade(50, 50, 45, 50) #== "F"
