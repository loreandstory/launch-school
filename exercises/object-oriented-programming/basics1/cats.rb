module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "#{name} says 'Meow!'"
  end
end

tater = Cat.new('Tater')
tater.greet
p tater.name
tater.name = 'spud'
tater.greet
p tater.name
