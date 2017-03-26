class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  # don't need to change names - do need to change balance and status

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    # initializes bank account with name and
    # defaults of $1000 for balance and 'open' for status
  end

  def deposit(money)
    @balance += money
    # adds money to the balance
  end

  def display_balance
    "Your balance is $#{@balance}."
    # returns string message with balance amount
  end

  def valid?
    @status == "open" && @balance > 0
    # a bank account is valid if it is open and balance greater than 0
  end

  def close_account
    @status = "closed"
    # closes an account
  end

end
