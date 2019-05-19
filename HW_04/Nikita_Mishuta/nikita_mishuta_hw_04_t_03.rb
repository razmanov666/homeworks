def task_4_3(array)
  array.flatten.uniq.sort { |x, y| -(x <=> y) }
end
