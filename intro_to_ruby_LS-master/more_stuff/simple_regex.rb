words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |word| 
  if word =~ /lab/
    puts "#{word} has 'lab' in it!"
  else
    puts "#{word} does not have 'lab' in it"
  end
end