def task_1(text)
  text.each_line do |i|
    return i.chomp if i.downcase.include? 'error'
  end
  ''
end
