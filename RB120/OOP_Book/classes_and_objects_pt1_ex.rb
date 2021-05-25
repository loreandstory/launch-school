class Vehicle
  attr_reader :make, :model, :year  
  attr_accessor :color, :car_on, :speed  

  @@cars_owned = 0

  def initialize(make, model, year, color)  
    @make = make    
    @model = model    
    @year = year    
    self.color = color
    self.car_on = false
    self.speed = 0

    @@cars_owned += 1
  end

  def self.print_cars_owned
    puts @@cars_owned
  end

  def info
    "#{self.color} #{self.year} #{self.make} #{self.model}, currently #{self.car_on ? 'on' : 'off'} and going at #{self.speed} mph"
  end
   
  def turn_on
    self.car_on = true
  end

  def shut_off
    if self.speed != 0
      puts "Car must brake till speed is 0 to turn off. Speed is currently #{self.speed} mph"
    else
     self.car_on = false
    end
  end

  def speed_up(amount)
    if self.car_on
      self.speed += amount
    else  
      puts "Must turn_on car to speed_up."
    end
  end

  def brake(amount)
    if self.speed - amount > 0
      self.speed -= amount
    else  
      self.speed = 0
    end
  end
  
 def spray_paint(new_color)
  self.color = new_color
 end

 def self.calc_gas_mileage(miles_gone, gallons_used)
   miles_gone.to_f / gallons_used
 end

 def to_s
   "#{@year} #{@make} #{@model} #{@color}"
 end

 def print_age
   self.age
 end

 private

 def age
   Time.new.year - self.year.to_i
 end
end

class MyCar < Vehicle
  DOORS = 4

  attr_reader :car_type
  
  def initialize(make, model, year, color, car_type)
    super(make, model, year, color)
    @car_type = car_type
  end
end

module TruckBed
  def open_bed
    puts "Bed opened!"
  end

  def close_bed
    puts "Bed closed!"
  end
end

class MyTruck < Vehicle
  DOORS = 2

  attr_reader :bed_size

  def initialize(make, model, year, color, bed_size)
    super(make, model, year, color)
    @bed_size = bed_size
  end

  include TruckBed
end

Vehicle.print_cars_owned
honda = MyCar.new('Honda', 'CR-V', '2010', 'Silver-blue', 'SUV')
p honda.info
p honda.car_type
honda.turn_on
p honda.info
honda.speed_up(15)
p honda.info
honda.brake(20)
p honda.info
honda.shut_off
p honda.info
p MyCar.calc_gas_mileage(15, 2)
p honda.print_age

Vehicle.print_cars_owned
f150 = MyTruck.new('Ford', 'F150', '2020', 'Black', 'Extended')
p f150.info
p f150.bed_size
f150.open_bed
f150.close_bed
p f150.print_age

Vehicle.print_cars_owned

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
