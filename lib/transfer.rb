class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  # status is the only value that needs to change

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    # 3 arguments passed in with status initialized with a default
  end

  def valid?
    @sender.valid? && @receiver.valid? && (sender.balance >= amount)
    # sender and receiver accounts 'open' and balance greater than 0
    # and the sender's balance is greater than or equal to amount being sent
  end

  def execute_transaction
    if @status == "pending" && valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # if status value is 'pending' and transaction is valid
    # subtract amount from sender and add to receiver, update status to complete
    # otherwise reject the transaction and return a message
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    end
    # if transaction status is complete
    # receiver subtracts amount from their balance
    # sender adds amount to their balance
    # status is updated to 'reversed'
  end

end
