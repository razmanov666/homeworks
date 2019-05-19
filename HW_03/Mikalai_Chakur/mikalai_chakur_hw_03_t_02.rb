def task_2(text)
  result = []
  date = /\[.*\]/
  ip = /^.* - -/
  msg = /T .* H/
  text.each_line do |i|
    result << make_str(i, date, ip, msg) if i.match?(/#{ip} #{date}.*#{msg}.*/)
  end
  result
end

def make_str(str, date, ip, msg)
  "#{str[date][1..-2]} FROM: #{str[ip][0..-4]}TO: #{str[msg][2..-3].upcase}"
end
