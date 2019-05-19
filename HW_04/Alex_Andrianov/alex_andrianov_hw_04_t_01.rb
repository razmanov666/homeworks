def task_4_1(num)
  array = []
  return [] if num < 0 || num > 1000
  return [num] if num.zero?

  fibonacci_rec(num, array) if num > 0
  array
end

def fibonacci_rec(num, array)
  fibo(1, 1, 1, num, array)
end

def fibo(first, second, count, num, array)
  fibo(second, first + second, count + 1, num, array << first) if count <= num
end
