def task_2(text)
  strings = []
  text.each_line do |st|
    date = st[%r{\w{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\D+\d{4}}]
    ip = st[/\d+.\d+.\d+.\d+/]
    text = st[%r{/[a-z]{4}/[0-9]/[a-z]{1,8}}]
    if date && ip && text
      strings.push(date + ' FROM: ' + ip + ' TO: ' + text.upcase)
    end
  end
  strings
end
