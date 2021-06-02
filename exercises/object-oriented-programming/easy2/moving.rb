class Mammal
  def name
    "Mammal"
  end

  def walk
    "#{name} #{gait} forward"
  end

  private

  def gait
    "runs"
  end
end

class Person < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title, :proper_name

  def initialize(name, title)
    super(name)
    @title = title
    @proper_name = "#{title} #{name}"
  end

  def walk
    "#{proper_name} #{gait} forward"
  end

  private

  def gait
    "struts"
  end
end

class Cat < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

p byron.name
#=> "Byron"
p byron.title
#=> "Lord"
