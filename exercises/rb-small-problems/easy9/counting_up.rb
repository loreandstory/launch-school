def sequence(integer)
  integer < 0 ? (integer..1).to_a : (1..integer).to_a
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]
p sequence(-1)
p sequence(-5)
