class Machine
  attr_reader :drinks, :suica_balancem, :earings

  def initialize(menus)
    @drinks = menus
  end

  def purchase
    if @drinks.stock < 1
      raise StandardError
      return
    end
    # "残りの在庫数"
    p @drinks.stock = @drinks.stock - 1
  end

  def get_stock(menu)
    # "補充したい在庫数"
    input = gets.chomp.to_i
    p menu.stock = menu.stock + input
  end

  def get_earings(drink)
    # "売上金額"
    earings = 0
    earings += drink.price
    p earings
  end

  def user_balance(suica, drink)
    raise StandardError if suica.balance < drink.price

    # puts "チャージ残高"
    p suica.balance = suica.balance - drink.price
    @suica_balance = suica.balance
  end
end
