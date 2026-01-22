module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      return 3.213
    end
    if balance < 1000
      return 0.5
    end
    if balance < 5000
      return 1.621
    end
    return 2.475
  end

  def self.annual_balance_update(balance)
    return balance * (1 + self.interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    balance = current_balance
    years = 0
    while balance <= desired_balance
      years = years + 1
      balance = self.annual_balance_update(balance)
    end
    return years
  end
end
