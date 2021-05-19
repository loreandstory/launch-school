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

  def update_available(transaction)
    self.spent = transaction[:amount_spent]
    self.available = self.budget - self.spent
  end

  def budget_spent_to_total
    spent_ratio = self.spent.to_f / self.budget
    out_of = 10

    [(spent_ratio * out_of).round, out_of]
  end

  def create_transaction_id(date_str)
    date_id = date_str.gsub('/', '')
    date_length = date_id.size

    transaction_number = self.transactions.keys.counts do |transaction_number|
      transaction_number[0, date_length] == date_id
    end

    date_id + transaction_number.to_s
  end

  def add_transaction(date_str, seller, purchase_description, amount_spent)
    transaction_id = create_transaction_id(date_str)

    self.transactions[transaction_id] = {
      seller: seller,
      purchase_description: purchase_description,
      amount_spent: amount_spent
    }
    update_available(self.transactions[transaction_id])

    puts "#{transaction_id}: #{seller}  #{purchase_description}  #{amount_spent}"
    puts "  => #{}"
  end

  def print_transactions
    self.transactions.each do |entry_id, entry|
      puts "#{entry_id}: #{entry[:seller]}  #{entry[:purchase_description]}  #{entry[:amount_spent]}"
    end
  end
end
