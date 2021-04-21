def swapcase(string)
  string.each_char.map do |char|
    case char
    when 'A'..'Z'
      char.downcase
    when 'a'..'z'
      char.upcase
    else
      char
    end
  end.join
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'
