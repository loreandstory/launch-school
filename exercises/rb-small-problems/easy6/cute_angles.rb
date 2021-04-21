DEGREE = "\xC2\xB0"

DEGREES_TO_MIN = 60
MIN_TO_SEC = 60
DEGREES_TO_SEC = DEGREES_TO_MIN * MIN_TO_SEC

## My first solution attempt
# def angle_values_string(degrees, min, sec)
#   "#{degrees}#{DEGREE}" + format("%02d", min) + "'" + format("%02d", sec) + "\""
# end
# 
# def dms(number)
#   if number.ceil == number
#     angle_values_string(number, 0, 0)
#   else
#     degrees = number.floor
#     remainder = (number % degrees) * 60
# 
#     min = remainder.floor
#     sec = (remainder % min) * 60
# 
#     if sec.ceil(2) == 60
#       min += 1
#       sec = 0.0
#     end
# 
#     angle_values_string(degrees, min.ceil(2), sec.ceil(2))
#   end
# end

def normalize_degrees(degrees_float)
  degrees_float % 360
end

def dms(degrees_float)
  normalized_degrees_float = normalize_degrees(degrees_float)
  total_seconds = (normalized_degrees_float * DEGREES_TO_SEC)
  degrees, remainder = total_seconds.divmod(DEGREES_TO_SEC)
  min, sec = remainder.divmod(MIN_TO_SEC)
  format(%(%d#{DEGREE}%02d'%02d"), degrees, min, sec)
end

p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(360) #== %(360°00'00") || dms(360) #== %(0°00'00")
p dms(400) #== %(40°00'00")
p dms(-40) #== %(320°00'00")
p dms(-420) #== %(300°00'00")
