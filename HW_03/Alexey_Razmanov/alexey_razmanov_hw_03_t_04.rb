def task_4(str)
  sum = 0
  str.each_char do |c|
    sum += c.to_i
  end
  sum
end
puts task_4('After 2018 I have only 6.5 fingers left')
