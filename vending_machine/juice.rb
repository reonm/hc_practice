class Juice
  attr_accessor :stock
  attr_reader :name, :price

  def initialize(name:, price:, stock:)
    @name = name
    @price = price
    @stock = stock
  end

  def info
    "#{@name} #{@price}円"
  end
end
