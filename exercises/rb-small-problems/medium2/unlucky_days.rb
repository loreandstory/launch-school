require 'date'

def friday_13th(year)
  date = Date.new(year, 1, 1, Date::GREGORIAN)
  number_friday_13ths = 0

  until date.friday?
    date += 1 # day
  end

  until date.year == year + 1
    number_friday_13ths += 1 if date.day == 13
    date += 7
  end

  number_friday_13ths
end

p friday_13th(2015) #== 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2
