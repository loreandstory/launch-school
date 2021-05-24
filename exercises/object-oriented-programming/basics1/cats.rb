module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  CAT_COLOR = 'green'

  attr_accessor :name

  include Walkable
    @@total_cats = 0

  def initialize(name)
    @name = name

    @@total_cats += 1
  end

  def self.total
    puts "There are currently #{@@total_cats} cats"
  end

  def identify
    self
  end

  def rename(new_name)
    self.name = new_name
  end

  def greet
    puts "#{name} the #{CAT_COLOR} cat says 'Meow!'"
  end

  def personal_greeting
    puts "Hi I'm #{name}"
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

tater = Cat.new('Tater')
tater.greet
p tater.name
tater.name = 'spud'
tater.greet
p tater.name
p tater.walk

Cat.generic_greeting
tater.class.generic_greeting
tater.rename('tater')
tater.greet

p tater.identify
tater.personal_greeting
Cat.total

spud = Cat.new('Spud')
Cat.total

puts tater
puts spud
