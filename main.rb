require_relative 'suica'
require_relative 'juice'
require_relative 'machine'

puts 'チャージしたい金額を入力してください'
input = gets.chomp.to_i
suica = Suica.new(input)
puts '残高'
p suica.show_balance

pepsi = Juice.new(name: 'pepsi', price: 150, stock: 5)
monster = Juice.new(name: 'monster', price: 230, stock: 5)
irohasu = Juice.new(name: 'irohasu', price: 120, stock: 5)
juices = [pepsi, monster, irohasu]
index = 0

machine = Machine.new(pepsi, monster, juices)
first_menu1 = 'ジュースを購入する'
first_menu2 = 'Suicaにチャージをする'
first_menu3 = '残高を確認する'
first_menu4 = '売上を確認する'
first_menu5 = '在庫を確認する'
first_menu6 = '在庫を補充する'

options = [first_menu1, first_menu2, first_menu3, first_menu4, first_menu5, first_menu6]
loop do
  index = 0
  options.each do |first_menu|
    index += 1
    puts "#{index} ." + first_menu.to_s
  end

  choice = gets.chomp.to_i
  @choice_menu = options[choice - 1]
  puts @choice_menu

  case choice
  when 1
    index = 0
    juices.each do |menu|
      index += 1
      puts "#{index}. " + menu.info
    end
    order = gets.chomp.to_i
    selected_juice = juices[order - 1]

    puts "\n                     "
    puts '商品代金'
    p "#{selected_juice.price}"
    puts "\n                     "
    suica.purchared_balance(selected_juice.price)
    puts "\n                     "

    machine.purchase(selected_juice)
    machine.get_earings(selected_juice)
    machine.buy(suica)

  when 2
    puts "\n                     "
    puts 'チャージしたい金額を入力してください'
    input2 = gets.chomp.to_i
    suica.recharge(input2)
    puts "\n                     "
    puts '残高'
    suica.show_recharged_balance
    puts "\n                     "
  when 3
    puts "\n                     "
    puts '現在の残高'
    suica.user_balance
    puts "\n                     "
  when 4
    puts "\n                     "
    puts '現在の売り上げ'
    machine.show_earings
    puts "\n                     "
  when 5
    puts "\n                     "
    machine.stock_check(pepsi, monster, irohasu)
  when 6
    puts "\n                     "
    puts '補充したいジュースの番号を選んでください'
    current_stock = [pepsi, monster, irohasu]
    index = 0
    current_stock.each do |menu|
      index += 1
      puts "#{index}. #{menu.name} #{menu.stock}個"
      puts "\n                     "
    end
    number = gets.chomp.to_i
    juices_quantity = current_stock[number - 1]
    puts '補充したい在庫数を入力してください'
    puts "\n                     "
    input3 = gets.chomp.to_i
    puts "\n                     "
    juices_quantity.increase_stock(input3, juices_quantity)
    puts "\n                     "
  end
end
