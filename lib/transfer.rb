require 'pry' 
class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
  
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      return "Transaction was already excuted"
    elsif @sender.status == "closed" || @receiver.status == "closed"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end

  def valid?
  #  if @sender.balance < amount
  #   return false
  #  end
   if @sender.valid? && @receiver.valid?
    return true
   else
   return false
   end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end