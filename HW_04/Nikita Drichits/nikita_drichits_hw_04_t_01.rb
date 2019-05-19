def task_4_1(index)
  return [] if index < 0
  return [0] if index.zero?

  first = 0
  second = 1
  array = [1]
  (2..index).each do |_i|
    first, second = second, first + second
    array << second
  end
  array
end
