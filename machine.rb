class Machine
  attr_reader :earings, :total_balance
@@earings = 0
  def initialize(_menu1, _menu2, _menu3)
    @total_balance
  end

  def get_earings(drink)
    # "売上金額"
    @@earings += drink.price
    p @@earings
  end

  def show_earings
    p @@earings
  end

  def purchase(drink)
    raise StandardError if drink < 1

    @total_stock = drink - 1
    # "残りの在庫数"
  end

  def stock_check
    puts @total_stock
  end

  def get_stock(input_stock, name)
    # "補充したい在庫数"

    puts "#{name}の残りの在庫数"

    @total_stock += input_stock
    p @total_stock
  end

  def buy(suica)
    raise StandardError if suica.balance < 120
  end
end
