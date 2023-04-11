class Juice
  attr_reader :name, :price, :stock

  def initialize(name:, price:, stock:)
    @name = name
    @price = price
    @stock = stock
  end

  def info
    "#{@name} #{@price}円"
  end

  def reduce_stock
    @stock -= 1
  end

  def increase_stock(input_stock, _drink)
    @stock += input_stock
    puts "\n                     "
    puts "#{@name}の在庫数"
    puts "\n                     "
    p @stock
  end
end
