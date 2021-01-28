VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

choice = nil

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = Kernel.gets().chomp()

  break if VALID_CHOICES.include?(choice)

  Kernel.puts("That's not a valid choice. Please try again.\n\n")
end

computer_choice = VALID_CHOICES.sample()

Kernel.puts("You chose: #{choice}, computer chose: #{computer_choice}")
