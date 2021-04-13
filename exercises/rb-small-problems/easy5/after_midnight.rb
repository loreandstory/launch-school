# time of day
### Can be represented as: # minutes before or after midnight.
### If number of minutes == positive => after midnight.
###                         negative => before midnight.
#
# Write a method that:
#  - takes a time (using this minue-based format).
#  - returns a time of day in 24 hour format (hh:mm).
#  - works on any integer input.
#  - may NOT use Ruby's Date and Time classes.

# If were able to use Date and Time...
#   require 'date'
#   require 'time'
#   
#   def time_of_day(minutes_boa_midnight)
#     time = Date.today.to_time
#   
#     time = time + (minutes_boa_midnight * 60)
#   
#     time.inspect.match(/\d{2}:\d{2}/)[0]
#   end

# Without using Date and Time...
## Must first figure out how to take minutes and tell when under or over 24 hours (start of new day).

HOURS_PER_DAY = 24
MIN_PER_HOUR = 60


def minutes_to_days_hours_minutes(minutes)
  hours = 0
  days = 0
  
  loop do
    if hours == HOURS_PER_DAY
      hours -= 24
      days += 1
    elsif minutes >= MIN_PER_HOUR
      minutes -= 60
      hours += 1
    else
      break
    end
  end

  [days, hours, minutes]
end

def time_of_day(minutes)
  d, h, m = minutes_to_days_hours_minutes(minutes.abs)

  time = if minutes.negative?
           [HOURS_PER_DAY - h - 1, MIN_PER_HOUR - m]
         else
           [h, m]
         end

  format("%02d", time[0]) + ":" + format("%02d", time[1])
end


# Method Testing
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
