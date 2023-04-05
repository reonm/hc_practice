class Juice
  attr_reader :name, :price, :stock

  def initialize(name:, price:, stock:)
    @name = name
    @price = price
    @stock = stock
    @total_stock = 0
  end

  def info
    "#{@name} #{@price}円"
  end

  def insufficient_funds(suica, drink)
    raise StandardError if suica.balance < drink.price
  end
end
