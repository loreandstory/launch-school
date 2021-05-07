UPPERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
LOWERS = UPPERS.downcase.freeze
OTHERS = ("^" + UPPERS + LOWERS).freeze

COUNTS = [LOWERS, UPPERS, OTHERS].freeze

def count_types(string)
  COUNTS.map { |type| string.count(type) }
end

def calculate_percentages(types, total)
  types.map { |type| (100 * type / total).round(2) }
end

def letter_percentages(string)
  total_count = string.length.to_f
  types_count = count_types(string)

  percentages = calculate_percentages(types_count, total_count)
  types = [:lowercase, :uppercase, :neither]

  types.zip(percentages).to_h
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')
puts

def letter_percentages(string)
  types_matching = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  total_chars    = string.length.to_f

  types_matching.each_with_object({}) do |(key, matching), percentages_hash|
    percentage            = 100 * string.count(matching) / total_chars
    percentages_hash[key] = percentage.round(2)
  end
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')
