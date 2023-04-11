class Machine
  attr_reader :earings, :total_stock

  @@earings = 0

  def initialize(drink1, drink2, drink3); end

  def get_earings(drink)
    # "売上金額"
    @@earings += drink.price
  end

  def show_earings
    p @@earings
  end

  def purchase(drink)
    raise StandardError if drink.stock < 1

    drink.reduce_stock
  end

  def stock_check(pepsi, monster, irohasu)
    puts "#{pepsi.name}  在庫数  #{pepsi.stock}個"
    puts "\n                     "
    puts "#{monster.name}  在庫数  #{monster.stock}個"
    puts "\n                     "
    puts "#{irohasu.name}  在庫数  #{irohasu.stock}個"
    puts "\n                     "
  end

  def buy(suica)
    raise StandardError if suica.balance < 120
  end
end
