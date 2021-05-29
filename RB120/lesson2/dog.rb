class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Dog
  def swim
    "cats don't swim!"
  end

  def speak
    'meow!'
  end

  def fetch
    "what, do you think I'm a dog?"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!

snouty = Bulldog.new
puts snouty.speak
puts snouty.swim

tater = Cat.new
puts tater.swim
puts tater.speak
puts tater.fetch
