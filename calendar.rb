# frozen_string_literal: true

require 'optparse'

# create opt object
opt = OptionParser.new

# register options
opt.on('-m') { |v| p v }

# check arguments
p ARGV
num = ARGV[1]
num = num.to_i

if (1..12).include?(num)
  puts num
else
  puts "#{num} is neither a month number (1..12) nor a name"
end

require 'date'

head = Date.today.strftime('%B %Y') # 今日の月と西暦を取得
year = Date.today.year
mon = Date.today.mon
firstday_wday = Date.new(year, mon, 1).wday   # 今月1日の曜日を取得(0~6)
lastday_date = Date.new(year, mon, -1).day    # 今月の最終日を取得
week = %w[Mo Tu We Th Fr Sa Su]
puts head.center(20)        # 月と西暦中央寄せで出力
puts week.join(' ')         # 曜日を出力
print '   ' * (firstday_wday - 1) # 1日までの空白を出力
wday = firstday_wday - 1
(1..lastday_date).each do |date|    # 1~最終日まで繰り返し
  print "#{date.to_s.rjust(2)} "    # 日付を右寄せで表示
  wday += 1
  print "\n" if (wday % 7).zero? # 土曜日まで表示したら改行
end
print "\n" if wday % 7 != 0
