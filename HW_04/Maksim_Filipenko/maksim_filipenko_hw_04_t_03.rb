def task_4_3(array)
  res = []
  array.each do |i|
    if i.class == Array
      i.each { |j| res.push(j) }
    else
      res.push(i)
    end
  end
  res.uniq.sort.reverse
end
