# frozen_string_literal: true
require 'optparse'
# create opt object
opt = OptionParser.new
# register options
opt.on('-m') { |v| p v }
# check arguments

num = ARGV[1].to_i

if (0..12).include?(num)
  puts num
else
  puts "#{num} is neither a month number (1..12) nor a name"
  return
end

require 'date'

year = Date.today.year
mon = num # 引数でもらってきた値を入れる
if mon.zero?
  mon = Date.today.mon # 引数がゼロだった場合は今月を指定する
end
title_year = mon.to_s + '月' + year.to_s 

title = Date::MONTHNAMES[mon] + ' ' + title_year # 月と西暦を連結して出力

firstday_wday = Date.new(year, mon, 1).wday   # 今月1日の曜日を取得(0~6)
lastday_date = Date.new(year, mon, -1).day    # 今月の最終日を取得
week = %w[Mo Tu We Th Fr Sa Su]

puts title.center(20)        # 月と西暦中央寄せで出力
puts week.join(' ')         # 曜日を出力

if firstday_wday.zero?
    wday = 0
else 
    print '   ' * (firstday_wday - 1)
    wday = firstday_wday - 1
end

(1..lastday_date).each do |date|    # 1~最終日まで繰り返し
	print "#{date.to_s.rjust(2)} "    # 日付を右寄せで表示
	wday += 1
	if (wday % 7).zero?   # 土曜日まで表示したら改行する
	  print "\n"
	elsif date == lastday_date   # 最後の日付の場合も改行する
	  print "\n"
	end
end