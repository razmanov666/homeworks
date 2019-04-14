def task_4_3(arr)
  arr.join(' ').split.sort.reverse.uniq.map(&:to_i)
end
