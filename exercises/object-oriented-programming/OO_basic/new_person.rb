class Person
  attr_accessor :first_name, :last_name

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    self.first_name + ' ' + self.last_name
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
