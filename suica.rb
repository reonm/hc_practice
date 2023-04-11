class Suica
  attr_reader :balance, :total_balance

  def initialize(balance)
    init_balance = 500
    raise StandardError if balance < 100

    @balance = balance + init_balance
  end

  def show_balance
    @balance
  end

  def purchared_balance(drink)
    @balance -= drink
  end

  def recharge(input_recharge)
    @balance += input_recharge
  end

  def show_recharged_balance
    puts @balance
  end

  def user_balance
    puts @balance
  end
end
