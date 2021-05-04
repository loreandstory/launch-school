def initialize_program
  { register: 0, stack: [] }
end

def parse_command_string(commands_string)
  commands_string.split
end
  
def error_detection(program, command)
  pop_commands = %w(ADD SUB MULT DIV MOD POP)
  non_pop_commands = %w(PUSH PRINT)

  case # returns `nil` if no issues, error string otherwise.
  when pop_commands.include?(command)
    program[:stack].empty? ? "Stack empty! Unable to execute '#{command}' command." : nil
  when non_pop_commands.include?(command)
    nil
  when command.match?(/^-?[0-9]+$/)
    nil
  else
    "Unknown command '#{command}'! Unable to execute program."
  end
end

def process_command(program, command)
  case command
  when /^-?[0-9]+$/ then program[:register] = command.to_i
  when 'PUSH'   then program[:stack] << program[:register]
  when 'ADD'    then program[:register] += program[:stack].pop
  when 'SUB'    then program[:register] -= program[:stack].pop
  when 'MULT'   then program[:register] *= program[:stack].pop
  when 'DIV'    then program[:register] /= program[:stack].pop
  when 'MOD'    then program[:register] %= program[:stack].pop
  when 'POP'    then program[:register] = program[:stack].pop
  when 'PRINT'  then puts program[:register]
  end
end

def minilang(commands_string)
  program = initialize_program
  command_list = parse_command_string(commands_string)

  command_list.cycle(1) do |command|
    error = error_detection(program, command)
    return error if error != nil
    process_command(program, command)
  end
end

puts 'Command string: PRINT'
print "minilang returned: #{minilang('PRINT')}\n\n"
# 0

puts 'Command string: 5 PUSH 3 MULT PRINT'
print "minilang returned: #{minilang('5 PUSH 3 MULT PRINT')}\n\n"
# 15

puts 'Command string: 5 PRINT PUSH 3 PRINT ADD PRINT'
print "minilang returned: #{minilang('5 PRINT PUSH 3 PRINT ADD PRINT')}\n\n"
# 5
# 3
# 8

puts 'Command string: 5 PUSH POP PRINT'
print "minilang returned: #{minilang('5 PUSH POP PRINT')}\n\n"
# 5

puts 'Command string: 3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT'
print "minilang returned: #{minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')}\n\n"
# 5
# 10
# 4
# 7

puts 'Command string: 3 PUSH PUSH 7 DIV MULT PRINT '
print "minilang returned: #{minilang('3 PUSH PUSH 7 DIV MULT PRINT ')}\n\n"
# 6

puts 'Command string: 4 PUSH PUSH 7 MOD MULT PRINT '
print "minilang returned: #{minilang('4 PUSH PUSH 7 MOD MULT PRINT ')}\n\n"
# 12

puts 'Command string: -3 PUSH 5 SUB PRINT'
print "minilang returned: #{minilang('-3 PUSH 5 SUB PRINT')}\n\n"
# 8

puts 'Command string: 6 PUSH'
print "minilang returned: #{minilang('6 PUSH')}\n\n"
# (nothing printed; no PRINT commands)

puts "Process (3 + (4 * 5) - 7) / (5 % 3)"
puts 'Command string: 3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 7 PUSH 3 SUB ADD DIV PRINT'
print "minilang returned: #{minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 7 PUSH 3 SUB ADD DIV PRINT')}\n\n"

puts "Command string: 3 PUSH BLAH"
print "minilang returned: #{minilang('3 PUSH BLAH')}\n\n"

puts "Command string: 3 PUSH POP POP"
print "minilang returned: #{minilang('3 POP POP')}\n\n"
