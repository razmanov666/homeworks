def task_4_1(number)
  return [0] if number.zero?

  return [] if number < 0

  cur = 1
  prev = 1
  fib = [1]
  (2..number).each do |_i|
    fib.append(cur)
    prev, cur = cur, prev + cur
  end
  fib
end
