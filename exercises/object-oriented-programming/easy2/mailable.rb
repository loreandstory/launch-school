module Mailable
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end

  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  attr_reader :name, :address, :city, :state, :zipcode

  include Mailable
end

class Employee
  attr_reader :name, :address, :city, :state, :zipcode

  include Mailable
end

betty = Customer.new('Jane Doe', '184 Test Street', 'Newark', 'NJ', '72934')
bob = Customer.new('John Doe', '184 Test Street', 'Newark', 'NJ', '72934')
betty.print_address
bob.print_address
