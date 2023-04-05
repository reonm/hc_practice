class Machine
  attr_reader :earings

  def initialize(_menu1, _menu2, _menu3)
    @earings = 0
    @total_balance = 0
  end

  def user_balance(suica, drink)
    raise StandardError if suica.balance < drink.price

    # puts "チャージ残高"
    @total_balance = suica.balance - drink.price
    puts @total_balance
    # @suica_balance = suica.balance
  end

  def get_earings(drink)
    # "売上金額"
    @earings += drink.price
    p @earings
  end

  def purchase(drink)
    raise StandardError if drink < 1

    # "残りの在庫数"
    p drink
  end

  def get_stock(menu, input_stock)
    # "補充したい在庫数"
    puts '在庫数'
    menu += input_stock
    p menu
  end
end
