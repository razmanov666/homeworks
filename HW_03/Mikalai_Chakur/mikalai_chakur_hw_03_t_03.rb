require 'date'

def task_3(text)
  date = []
  text.each_line do |i|
    date << line_to_time(i) if i.include? 'Calling core with action:'
  end
  return '0' if date.size < 2

  result = ((date[1] - date[0]) / 1000.0).to_s
  result
end

def line_to_time(str)
  DateTime.strptime(str,
                    '%Y-%m-%d %H:%M:%S.%L').strftime('%Q').to_i
end
