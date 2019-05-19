def task_4(text)
  str_num = text.tr(':-~', '').tr('!-/', '').split
  digits = []
  str_num.each { |i| digits.concat(i.to_i.digits) }
  sum = 0
  digits.each { |i| sum += i }
  sum
end
