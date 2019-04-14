def task_4_1(num)
  if num.class != Integer
    []
  elsif num > 1000 || num < 0
    []
  elsif num == 1
    [1]
  elsif num.zero?
    [0]
  else task_4_1_calc(num)
  end
end

def task_4_1_calc(num)
  fib = [1, 1]
  (2..num - 1).each do |el|
    fib[el] = fib[el - 2] + fib[el - 1]
    return fib if el.size == 47
  end
  fib
end
