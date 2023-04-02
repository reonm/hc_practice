require_relative 'suica'
require_relative 'juice'
require_relative 'machine'

puts 'チャージしたい金額を入力してください'
input = gets.chomp.to_i
suica1 = Suica.new(input)
puts '残高'
p suica1.show_balance

menu1 = Juice.new(name: 'ペプシ', price: 150, stock: 5)
menu2 = Juice.new(name: 'モンスター', price: 230, stock: 5)
menu3 = Juice.new(name: 'いろはす', price: 120, stock: 5)
# menus = [menu1, menu2, menu3]
# index = 0
# menus.each do |menu|
#   index += 1
#   puts "#{index}. " + menu.info
# end
# order = gets.chomp.to_i
# @selected_menu = menus[order - 1]
# puts '商品代金'
# p "#{@selected_menu.price}"

machine = Machine.new(@selected_menu)
first_menu1 = 'ジュースを購入する'
first_menu2 = 'Suicaにチャージをする'
first_menu3 = '残高を確認する'
first_menu4 = '売上を確認する'
first_menu5 = '在庫を確認する'
first_menu6 = '在庫を補充する'

menus = [first_menu1, first_menu2, first_menu3, first_menu4, first_menu5, first_menu6]
loop do
  index = 0
  menus.each do |first_menu|
    index += 1
    puts "#{index} ." + first_menu.to_s
  end

  choice = gets.chomp.to_i
  @choice_menu = menus[choice - 1]
  puts @choice_menu

  case choice
  when 1
    menus = [menu1, menu2, menu3]
    index = 0
    menus.each do |menu|
      index += 1
      puts "#{index}. " + menu.info
    end
    order = gets.chomp.to_i
    @selected_menu = menus[order - 1]
    puts "\n                     "
    puts '商品代金'
    p "#{@selected_menu.price}"
    puts "\n                     "
  when 2
    puts "\n                     "
    puts 'チャージしたい金額を入力してください'
    input3 = gets.chomp.to_i
    suica1.recharge(input3)
    puts "\n                     "
    puts '残高'
    suica1.show_recharged_balance
    puts "\n                     "
  when 3
    puts "\n                     "
    puts '現在の残高'
    puts machine.user_balance(suica1, @selected_menu)
    puts "\n                     "
  when 4
    pputs "\n                     "
    puts '現在の売り上げ'
    machine.get_earings(@selected_menu)
    puts "\n                     "
  when 5
    puts "\n----------------------------------------"
    machine.purchase
  when 6
    puts "\n                     "
    puts '補充したい在庫数を入力してください'
    input2 = gets.chomp.to_i
    puts "\n                     "
    machine.get_stock(@selected_menu, input2)
    puts "\n                     "
  end
end
