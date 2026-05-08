class BankAccount
  def initialize
    @money = 0
    @active = false
  end

  def open
    raise ArgumentError.new('You can\'t open an already open account') if @active
    @active = true
  end

  def close
    raise ArgumentError.new('You can\'t close an already closed account') unless @active
    @active = false
    @money = 0
  end
  
  def deposit(amount)
    raise ArgumentError.new('You can\'t deposit money into a closed account') unless @active
    raise ArgumentError.new('You can\'t deposit a negative amount') unless amount >= 0
    @money += amount
  end

  def withdraw(amount)
    raise ArgumentError.new('You can\'t withdraw money into a closed account') unless @active
    raise ArgumentError.new('You can\'t withdraw more than you have') unless @money >= amount
    raise ArgumentError.new('You can\'t withdraw a negative amount') unless amount >= 0
    @money -= amount
  end

  def balance
    raise ArgumentError.new('You can\'t check the balance of a closed account') unless @active
    @money
  end
  
end