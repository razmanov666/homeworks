def task_4_3(array)
  array.flatten.uniq.sort { |x, y| y <=> x }
end
p task_4_3 [3, 3, 3, 3]
