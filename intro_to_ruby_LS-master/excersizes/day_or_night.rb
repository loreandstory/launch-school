daylight = [true, false].sample

def day_or_night(boolean)
  puts boolean ? "It's daytime!" : "It's nighttime!"
end


day_or_night(daylight)
