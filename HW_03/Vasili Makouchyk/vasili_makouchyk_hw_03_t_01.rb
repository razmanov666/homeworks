def task_1(text)
  text.lines.each do |string|
    return string.chop if string.downcase.include?('error')
  end
  ''
end
