FEATURED_BASE = 7

def div_by_base?(integer)
  integer % FEATURED_BASE == 0
end

def no_reoccuring_digits?(integer)
  duplicates_removed = integer.to_s.chars.uniq.join.to_i
  duplicates_removed == integer
end

def valid_featured_number?(integer)
  div_by_base?(integer) && integer.odd? && no_reoccuring_digits?(integer)
end


def featured(number)
  featureds_fit_in, _ = number.divmod(FEATURED_BASE)
  next_featured = FEATURED_BASE * (featureds_fit_in + 1) # Just a starting value

  loop do
    break if next_featured >= 9_876_543_210
    return next_featured if valid_featured_number?(next_featured)
    next_featured += FEATURED_BASE
  end

  "No next featured number exists for the number #{number} provided."
end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
