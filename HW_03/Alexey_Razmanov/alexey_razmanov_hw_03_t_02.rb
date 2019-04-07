def task_2(string)
  res = []
  string.each_line do |s|
    ip = s[/.* - -/]
    date = s[/[\[].*[\]]/]
    path = s[/T .* H/]
    if date && path && ip
      res << date[1..-2] + ' FROM: ' + ip[0..-5] + ' TO:' + path[1..-3].upcase
    end
  end
  res
end
