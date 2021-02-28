# Need a program that excutes the exclusive or logic, i.e.:
#
#  inputs: true/true or false/false ==> false
#          false/true or true/false ==> true

def xor?(bool1, bool2)
  # how to make the logic work out?
  # true && true == true
  # true || false or false || true or true || true == true
  # so, xor is or, but with the true || true condition removed/changed to false
  
  bool1 == bool2 ? false : bool1 || bool2
end

# Test cases
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
