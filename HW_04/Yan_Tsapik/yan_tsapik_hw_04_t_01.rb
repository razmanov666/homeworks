def task_4_1(number)
  return [0] if number.zero?
  return [] if number < 0 || number > 1000
  return [1] if number == 1

  eval_fib(number)
end

def eval_fib(number)
  a = 1
  b = 1
  arr = [a, b]
  (number - 2).times do
    b, a = a + b, b
    arr << b
  end
  arr
end
