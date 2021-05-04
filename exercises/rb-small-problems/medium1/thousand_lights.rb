def toggle_light(lights_arr, index)
  lights_arr[index] = !lights_arr[index]
end

def toggle_lights_for_round(lights_arr, round_number)
  lights_arr.each_with_index do |light, index|
    light_number = index + 1
    toggle_light(lights_arr, index) if light_number % round_number == 0
  end
end

def fill_on_light_numbers(lights_arr)
  lights_arr.map.with_index do |light_on , index|
    light_number = index + 1
    light_on ?  light_number : light_on
  end
end

def filter_out_off_lights(lights_arr) 
  lights_arr.select { |light_on| light_on }
end

def thousand_lights(number_lights, rounds=number_lights)
  lights = Array.new(number_lights, false)

  for round_num in 1..rounds
    toggle_lights_for_round(lights, round_num)
  end

  filled_on_lights = fill_on_light_numbers(lights)

  lights_on = filter_out_off_lights(filled_on_lights)

end

p thousand_lights(5, 0)
p thousand_lights(5, 1)
p thousand_lights(5, 2)
p thousand_lights(5, 3)
p thousand_lights(5, 4)
p thousand_lights(5)
p thousand_lights(50, 10)
p thousand_lights(1000)
