def tip_calculator
  # Inputs: prompt user for: 1) bill amount, 2) top rate
  # Outputs: display: 1) tip amount, 2) total bill amount
  #
  # Assumption:
  #  - must accept inputs as floats
  #  - outputs should be given as floats as well
  #  - all numbers/calculations should be rounded to 00.00
  #  - all amounts > 0

  print "=> What is the bill?: "
  base_bill = gets.to_f.round(2)

  print "=> What is the tip percentage (ex: 15)?: "
  tip_percentage = (gets.to_f / 100)

  tip = (base_bill * tip_percentage).round(2)

  total = base_bill + tip

  puts "The tip is $#{sprintf("%.2f", tip)}"
  puts "The total is $#{sprintf("%.2f", total)}"

  [tip, total]
end

tip_calculator
