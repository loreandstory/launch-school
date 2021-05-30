class Person
 attr_accessor :first_name
 attr_reader :age, :phone_number
 attr_writer :last_name, :age

 def initialize(n)
   @phone_number = n
 end

 def name
   @name.clone
 end

 def name=(n)
   @name = n.capitalize
 end

 def first_equals_last?
   first_name == last_name
 end

 def older_than?(other)
   age > other.age
 end

 private

 attr_reader :last_name

 protected

 attr_reader :age
end

person1 = Person.new('0123456789')
person1.name = 'Nariman'
puts person1.name
puts person1.phone_number

person2 = Person.new('01234678')
person2.first_name = 'Dave'
person2.last_name = 'Smith'
puts person2.first_equals_last?

person1.age = 35
person2.age = 50

puts person2.older_than?(person1)

person2.name = 'dAvE'
puts person2.name
person2.name.reverse!
puts person2.name
