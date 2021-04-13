require 'time'
require 'date'

MIN_TO_SEC = 60
HOURS_TO_MIN = 60
DAY_TO_HOURS = 24
DAYS_TO_MIN = DAY_TO_HOURS * HOURS_TO_MIN

# Wihtout Date or Time modules...
def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * HOURS_TO_MIN + minutes) % DAYS_TO_MIN
end

def before_midnight(time_str)
  minutes = DAYS_TO_MIN - after_midnight(time_str)
  minutes = 0 if minutes == DAYS_TO_MIN
  minutes
end

# With Time and Date modules...
## def delta_time_in_min(time1, time2)
##   change_in_time = time1 - time2
## 
##   (change_in_time/MIN_TO_SEC).to_i
## end
## 
## def after_midnight(time_str)
##   base_time = Time.parse("00:00")
##   time = Time.parse(time_str)
## 
##   if time.day - base_time.day > 0
##     0
##   else
##     delta_time_in_min(time, base_time)
##   end
## end
## 
## def before_midnight(time_str)
##   base_time = Time.parse("24:00")
##   time = Time.parse(time_str)
## 
##   if delta_time_in_min(base_time, time) == DAYS_TO_MIN
##     0
##   else
##     delta_time_in_min(base_time, time)
##   end
## end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
