def letter_case_count(string)
  counter_hsh = {lowercase: 0, uppercase: 0, neither: 0}

  string.each_char do |char|
    case char
    when /[a-z]/
      counter_hsh[:lowercase] += 1
    when /[A-Z]/
      counter_hsh[:uppercase] += 1
    else
      counter_hsh[:neither] += 1
    end
  end

  counter_hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
