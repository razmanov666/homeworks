require 'date'

def task_3(string)
  res = '0'
  arr = []
  string.each_line do |s|
    arr.push(s) if s.include?('Calling core with action:')
  end
  res = time_btwn_acts(arr) if arr.size >= 2
  res
end

def time_btwn_acts(arr)
  finish = DateTime.strptime(arr.last,
                             '%Y-%m-%d %H:%M:%S.%L').strftime('%Q').to_i
  start = DateTime.strptime(arr.first,
                            '%Y-%m-%d %H:%M:%S.%L').strftime('%Q').to_i
  (finish - start) / 1000.0
end
