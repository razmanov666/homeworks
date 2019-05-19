def task_4_1(kol)
  arr = [1]
  if kol.zero?
    [0]
  elsif kol < 0 || kol > 1000
    []
  elsif kol == !Integer
    []
  else
    fib_loop(arr, kol)
  end
end

def fib_loop(arr, kol)
  i = 0
  while arr.length < kol
    if arr.length == 1
      arr.push(1)
    else
      arr.push(arr[i] + arr[i - 1])
    end
    i += 1
  end
  arr
end

def test(kol); end
print task_4_1(5)
