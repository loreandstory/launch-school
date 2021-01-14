require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
  print message
  gets.chomp
end

def valid_amount?(amount)
  (amount =~ /^\d{1,3}(,\d{3})*$/) ? true : false
end

name = prompt(MESSAGES['welcome'])
puts "Hi #{name}! Let's get started."

loop do  # Request loan amount
  loan_amount = prompt(MESSAGES['request_loan_amount'])
  break if valid_amount?(loan_amount)
  puts(MESSAGES['error_loan_amount'])
end
