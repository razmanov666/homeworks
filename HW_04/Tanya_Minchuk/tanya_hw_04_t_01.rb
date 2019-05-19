def task_4_1(num)
  return [] if num > 1000 || num < 0
  return [0] if num.zero?
  return [1] if num == 1

  fib = [1, 1]
  (num - 2).times do
    fib << fib[-1] + fib[-2]
  end
  fib
end
