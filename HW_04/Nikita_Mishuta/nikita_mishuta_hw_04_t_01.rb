def task_4_1(number)
  return [] if number < 0
  return [0] if number.zero?
  return [1] if number == 1

  (3..number).inject([1, 1]) { |fib| fib << fib.last(2).inject(:+) }
end
