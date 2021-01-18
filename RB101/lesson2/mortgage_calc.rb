
###########################################################
#         Load required gems and init varables            #
###########################################################
require 'yaml'
require 'pry'

name = nil
loan_amount = nil
apr = nil
loan_duration = nil
continue = nil

###########################################################
#         Load messages and define functions              #
###########################################################
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
  print message
  gets.chomp
end

def valid_name?(name)
  (name =~ /^[a-z]+$/i) ? true : false
end

def valid_amount?(amount)
  (amount =~ /^\d{1,3}(,\d{3})*$/) ? true : false
end

def valid_apr?(apr)
  (apr =~ /^\d{1,2}(\.\d{1,2})?$/) ? true : false
end

def valid_duration?(duration)
  (duration =~ /^\d{1,2}$/) ? true : false
end

def calculate_loan_data(amount, apr, duration)
  # note that all input are strings, which will be converted below...
  monthly_rate = (apr.to_f / 12) / 100
  duration_in_months = duration.to_i * 12

  monthly_payment =
    amount.split(',').join('').to_i * (
               monthly_rate / 
               (1 - (1 + monthly_rate)**(-duration_in_months))
             )


  loan_details = {
    rate_mnth: monthly_rate,
    duration_mnth: duration_in_months,
    payment_mnth: monthly_payment
  }
  print <<-LOAN_INFO

    [[ Loan Summary ]]
    Interest rate per month: #{loan_details[:rate_mnth] * 100}%
    Loan duration (months): #{loan_details[:duration_mnth]} 
    Payment per month: #{loan_details[:payment_mnth]} 

  LOAN_INFO

  loan_details
end


###########################################################
#      Request loan info and calculate desired data       #
###########################################################
loop do
  loop do  # Request name
    name = prompt(MESSAGES['welcome'])
    if valid_name?(name)
      puts "Hi #{name}! Let's get started.\n\n"
      break
    else
      puts(MESSAGES['error_name'])
    end
  end

  loop do  # Request loan amount
    loan_amount = prompt(MESSAGES['request_loan_amount'])
    break if valid_amount?(loan_amount)
    puts(MESSAGES['error_loan_amount'])
  end

  loop do  # Request Annual Percentage Rate (APR)
    apr = prompt(MESSAGES['request_apr'])
    break if valid_apr?(apr)
    puts(MESSAGES['error_apr'])
  end

  loop do  # Request loan duration in years
    loan_duration = prompt(MESSAGES['request_loan_duration'])
    break if valid_duration?(loan_duration)
    puts(MESSAGES['error_loan_duration'])
  end



  calculate_loan_data(loan_amount, apr, loan_duration)
  puts("Thank you for using mortgage calculator!")

  loop do
    continue = prompt(MESSAGES['request_continue'])
    
    break if /^n$/i =~ continue || /^y$/i =~ continue
    puts(MESSAGES['error_continue'])
  end

  
  if /^n$/i =~ continue
    break
  elsif /^n$/i =~ continue
    next
  end
end
