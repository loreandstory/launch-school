names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names_array)
  names_array.sample
end

def activity(activities_array)
  activities_array.sample
end

def sentence(name, activity)
  name + ' went ' + activity + ' today!'
end


puts sentence(name(names), activity(activities))
puts sentence(name(names), activity(activities))
puts sentence(name(names), activity(activities))
