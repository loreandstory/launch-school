def greet_user(users, name)
  users.each do |user|
    puts "Hello " + user["username"] + "!" if user["username"] == name
  end
end


def add_user(users)
  print "New User Name: "
  new_name = gets.chomp
  print "Set Password: "
  new_user_pswd = gets.chomp

  users << { "username" => new_name, "password" => new_user_pswd }
end

def list_users(users)
  users.each do |user|
    puts user["username"]
  end
end


def remove_user(users)
  print "User to remove: "
  name = gets.chomp
  print "Password of user to remove: "
  password = gets.chomp
  users.delete({"username"=>name, "password"=>password})
end


method = ""
users = []
username = ""

until method == "exit" do

  if username == ""
    print "Log in as user: "
    username = gets.chomp
  end

  print "Enter command: "
  method = gets.chomp

  if method == "add user"
    users = add_user(users)
  elsif method == "remove user"
    users = remove_user(users)
  elsif method == "list users"
    list_users(users)
  elsif method == "greet user"
    greet_user(users, username)
  elsif method == "log out"
    username = ""
  elsif method == "exit"
    puts "Bye!"
  else
    puts "Command not recognized...\n\n"
    print "Commands:\n add user\n remove user\n list users\n greet user\n log out\n exit\n\n"
  end

end
