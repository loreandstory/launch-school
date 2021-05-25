class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    self.grade = grade
  end

  def better_grade_than?(name)
    grade > name.grade
  end

  protected

  attr_accessor :grade
end

joe = Student.new('Joe', 85)
bob = Student.new('Bob', 93)
nariman = Student.new('Nariman', 100)

puts bob.better_grade_than?(nariman)
puts "Well done!" if joe.better_grade_than?(bob)
puts "Well done!" if nariman.better_grade_than?(bob)
