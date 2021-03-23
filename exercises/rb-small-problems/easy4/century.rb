require 'bigdecimal'

def get_century_start(year_integer)
  year_rounded_to_hundredth = BigDecimal(year_integer).round(-2, :up).to_i
  century = year_rounded_to_hundredth / 100

  century_start_text = century.to_s
end

def get_century_end(cent_start_str)
  first_cent_digit = cent_start_str[-1]
  second_cent_digit = cent_start_str[-2]

  if second_cent_digit == "1"
    "th"

  else
    case first_cent_digit
    when "1" then "st"
    when "2" then "nd"
    when "3" then "rd"
    else "th"
    end
  end
end

def century(year_integer)
  century_start = get_century_start(year_integer)
  century_end = get_century_end(century_start)

  century_start + century_end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
