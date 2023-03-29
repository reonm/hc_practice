class Suica
  attr_accessor :balance

  def initialize(balance)
    init_balance = 500
    raise StandardError if balance < 100

    @balance = balance + init_balance
  end

  def show_balance
    #  "合計金額"
    @balance
  end
end
