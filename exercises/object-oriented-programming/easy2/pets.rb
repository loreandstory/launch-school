class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize(*unadopted_pets)
    @unadopted_pets = unadopted_pets
    @current_owners = {}
  end

  def adopt(new_owner, pet)
    new_owner.add_pet(pet)
    @unadopted_pets.delete(pet)
    @current_owners[new_owner.name] ||= new_owner
  end

  def print_adoptions
    puts "The Animal Shelter has the following unadopted pets:"
    puts @unadopted_pets
    puts

    @current_owners.each_pair do |owner_name, owner|
      puts "#{owner_name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
fluffy       = Pet.new('dog', 'Fluffy')
tater        = Pet.new('cat', 'Tater')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new(butterscotch, pudding, darwin, kennedy, sweetie, molly, chester, fluffy, tater)
shelter.print_adoptions
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
