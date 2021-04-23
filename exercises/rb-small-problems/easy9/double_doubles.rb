def double_number?(integer)
  stringified_integer = integer.to_s
  integer_length = stringified_integer.length

  return false if integer_length.odd?

  middle = integer_length / 2
  first_half_int = stringified_integer[...middle]
  second_half_int = stringified_integer[middle..]

  first_half_int == second_half_int
end

def twice(integer)
  double_number?(integer) ? integer : integer * 2
end

p twice(0) #== 0
p twice(37) #== 74
p twice(44) #== 44
p twice(334433) #== 668866
p twice(444) #== 888
p twice(107) #== 214
p twice(103103) #== 103103
p twice(3333) #== 3333
p twice(7676) #== 7676
p twice(123_456_789_123_456_789) #== 123_456_789_123_456_789
p twice(5) #== 10
