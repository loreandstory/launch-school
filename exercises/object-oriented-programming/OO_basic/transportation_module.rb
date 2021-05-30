module Transportation
  class Vehicle; end

  class Truck < Vehicle; end
  class Car < Vehicle; end
end

truck1 = Transportation::Truck.new
p truck1

car1 = Transportation::Car.new
p car1
