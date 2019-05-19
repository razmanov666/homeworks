def task_4(text)
  text2 = text.chars
  res = text2.inject(0) { |sum, n| sum + n.to_i }
  res
end
