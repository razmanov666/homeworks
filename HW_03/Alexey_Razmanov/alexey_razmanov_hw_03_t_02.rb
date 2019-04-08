def task_2(str)
  
  task_2_sort(str).map do |line|
    ip = line[/.* - -/]
    date = line[/[\[].*[\]]/]
    path = line[/T .* H/]
    if date && path && ip
      date[1..-2] + ' FROM: ' + ip[0..-5] + ' TO:' + path[1..-3].upcase
    end
  end
end

def task_2_sort(str)
  str.each_line.select do |line|
    ip = line[/.* - -/]
    date = line[/[\[].*[\]]/]
    path = line[/T .* H/]
    if date && path && ip
     date[1..-2] + ' FROM: ' + ip[0..-5] + ' TO:' + path[1..-3].upcase
    end
  end
end

str = "10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] \"POST /test/2/messages HTTP/1.1\" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] \"POST /test/2/run HTTP/1.1\" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] \"POST /test/2/messages HTTP/1.1\" 200 48 0.0290"
puts task_2(str)
