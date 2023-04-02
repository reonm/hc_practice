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
menus = [menu1, menu2, menu3]
index = 0
menus.each do |menu|
  index += 1
  puts "#{index}. " + menu.info
end
order = gets.chomp.to_i
@selected_menu = menus[order - 1]
puts '商品代金'
p "#{@selected_menu.price}"

machine = Machine.new(@selected_menu)

first_menu1 = '残高を確認する'
first_menu2 = '売上を確認する'
first_menu3 = '在庫を確認する'
first_menu4 = '在庫を補充する'
first_menu5 = 'メニューを終了する'

menus = [first_menu1, first_menu2, first_menu3, first_menu4, first_menu5]
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
    puts '現在の残高'
    puts machine.user_balance(suica1, @selected_menu)
  when 2
    puts '現在の売り上げ'
    machine.get_earings(@selected_menu)
  when 3
    puts '現在の在庫数'
    machine.purchase
  when 4
    puts '補充したい在庫数を入力してください'
    input2 = gets.chomp.to_i
    machine.get_stock(@selected_menu, input2)
  when 5
    break
  end
end
