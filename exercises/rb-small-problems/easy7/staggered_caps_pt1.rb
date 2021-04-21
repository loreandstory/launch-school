def staggered_case(string, start_2nd_index=false, consider_all_chars=true)
  string.each_char.map.with_index do |char, index|
    to_upcase = if char.match(/[a-z]/i) || consider_all_chars
                  if start_2nd_index
                    index.odd? # i.e. index 1, 3, 5
                  else
                    index.even? # i.e. 0, 2, 4
                  end
                else # i.e., not a character that can be capitalized
                  nil
                end

    next char if to_upcase == nil
    to_upcase ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

print "\nWith stagger set to start on 2nd index...\n"
p staggered_case('I Love Launch School!', true)
p staggered_case('ALL_CAPS', true)
p staggered_case('ignore 77 the 444 numbers', true)

print "\nWith stagger sometimes set to 2nd and consideration sometimes set to only a-z\n"
p staggered_case('I Love Launch School!', true, false)
p staggered_case('ALL_CAPS', false, true)
p staggered_case('ignore 77 the 444 numbers', true, false)
