require 'date'
require 'time'

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
# rubocop:disable LineLength
str = "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event"
# rubocop:enable LineLength
puts task_3(str)
