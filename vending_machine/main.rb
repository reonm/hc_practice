require_relative 'suica'
require_relative 'juice'
require_relative 'machine'

input = gets.chomp.to_i
suica1 = Suica.new(input)
p suica1.show_balance
# puts "商品を選んでください"
menu1 = Juice.new(name: 'ペプシ', price: 150, stock: 5)
menu2 = Juice.new(name: 'モンスター', price: 230, stock: 5)
menu3 = Juice.new(name: 'いろはす', price: 120, stock: 5)
menus = [menu1, menu2, menu3]
index = 0
menus.each do |menu|
  index += 1
  puts "#{index}. " + menu.info
end

order = gets.chomp.to_i
@selected_menu = menus[order - 1]
# puts "商品代金"
puts "#{@selected_menu.price}"

machine = Machine.new(@selected_menu)
machine.purchase
machine.get_earings(@selected_menu)
machine.user_balance(suica1, @selected_menu)
machine.get_stock(@selected_menu)
