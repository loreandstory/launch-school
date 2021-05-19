class MyCar
  attr_reader :make, :model, :year  
  attr_accessor :color, :car_on, :speed  

  def initialize(make, model, year, color)  
    @make = make    
    @model = model    
    @year = year    
    @color = color
    @car_on = false
    @speed = 0
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
end
