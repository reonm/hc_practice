require_relative 'suica'
require_relative 'juice'
require_relative 'machine'

first_menu1 = 'ジュースを購入する'
first_menu2 = 'Suicaにチャージする'
first_menu3 = 'Suica残高を確認する'
first_menu4 = '売上を確認する'
first_menu5 = '在庫を確認する'
first_menu6 = '在庫を補充する'
first_menu7 = 'メニューを終了する'
menus = [first_menu1, first_menu2, first_menu3, first_menu4, first_menu5, first_menu6, first_menu7]
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
    break

  when 2
    puts 'チャージしたい金額を入力してください'
    input = gets.chomp.to_i
    suica1 = Suica.new(input)
    p suica1.show_balance

  when 3
    machine = Machine.new(@selected_menu)
    machine.user_balance(suica1, @selected_menu)
  end
end

# machine = Machine.new(@selected_menu)
# machine.purchase
# machine.get_earings(@selected_menu)
# machine.user_balance(suica1, @selected_menu)
# input2 = gets.chomp.to_i
# machine.get_stock(@selected_menu, input2)
