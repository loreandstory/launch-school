STATUS_BAR_SIZE = 50

class AccountBudget
  attr_accessor :name, :description, :budget, :available, :spent, :transactions

  def initialize(name, description, budget)
    @name = name
    @description = description
    @budget = budget
    @available = budget
    @spent = 0
    @transactions = {}
  end

  def update_available(amount_spent)
    self.spent -= amount_spent
    self.available = self.budget - self.spent
    nil
  end

  def budget_spent_out_of_ten
    spent_ratio = self.spent.to_f / self.budget

    (spent_ratio * STATUS_BAR_SIZE).ceil
  end

  def create_transaction_id(date_str)
    date_id = date_str.gsub('/', '')
    date_length = date_id.size

    number_transactions_today = self.transactions.keys.count do |transaction_number|
      transaction_number[0, date_length] == date_id
    end

    date_id + number_transactions_today.to_s
  end

  def get_date_from_transaction_id(entry_id)
    entry_id[0,2] + '/' + entry_id[2,2] + '/' + entry_id[4,2]
  end

  def format_amount(amount, show_sign=false)
    sign = show_sign ? '+' : ''
    sprintf("%#{sign}.2f", amount)
  end


  def print_newest_transaction_and_account_status(entry)
    newest_entry_id = entry.keys.last
    newest_entry = transactions[newest_entry_id]

    spent_out_of_ten = budget_spent_out_of_ten
    status_bar = "[#{'.' * spent_out_of_ten}#{'#' * (STATUS_BAR_SIZE - spent_out_of_ten)}]"

    date = get_date_from_transaction_id(newest_entry_id)
    current_amounts = "budget: #{format_amount(self.budget)}\nspent:  #{format_amount(self.spent)}\nleft:   #{format_amount(self.available)}"

    spaced_out_account_name = self.name.upcase.split('').join(' ')
    entry_id_line = "ID " + newest_entry_id

    puts "\n"*2 + spaced_out_account_name

    puts "\nN e w  T r a n s a c t i o n"
    puts "\n" + entry_id_line
    puts "-" * entry_id_line.length

    puts "date:        #{date}"
    puts "amount:      #{newest_entry[:amount_spent]}"
    puts "entity:      #{newest_entry[:seller]}"
    puts "description: #{newest_entry[:purchase_description]}"

    puts "\n\nA c c o u n t  S t a t u s"
    puts "\n" + status_bar
    puts current_amounts + "\n"*3
  end


  def add_transaction(date_str, seller, purchase_description, amount_spent)
    transaction_id = create_transaction_id(date_str)

    self.transactions[transaction_id] = {
      seller: seller,
      purchase_description: purchase_description,
      amount_spent: amount_spent
    }

    update_available(amount_spent)
  end

  def print_transactions
    amount_size = "^-Amount".size

    self.transactions.each do |entry_id, entry|
      date = get_date_from_transaction_id(entry_id)
      puts "#{date} | #{entry_id} | #{format_amount(entry[:amount_spent].to_s.rjust(amount_size), true)} | #{entry[:seller]} | #{entry[:purchase_description]} | "
    end
    
    puts " ^-Date  |  ^-ID   |   ^-Amount | ^-Entity | ^-Description"
  end
end

groceries = AccountBudget.new('Groceries', 'food, clothing, etc.', 300)
groceries.add_transaction('05/31/21', 'Target', 'bananas and ice cream', -12.00)
groceries.print_newest_transaction_and_account_status(groceries.transactions)
groceries.add_transaction('05/31/21', 'Target', 'bananas and ice cream', -12.00)
groceries.add_transaction('06/01/21', 'HEB', 'salad', -50.00)
groceries.add_transaction('06/01/21', 'HEB', 'salad', 50.00)
groceries.print_transactions
