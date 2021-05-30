class Pet
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :coat_description

  def initialize(name, age, coat_description)
    super(name, age)
    @coat_description = coat_description
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{coat_description} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
