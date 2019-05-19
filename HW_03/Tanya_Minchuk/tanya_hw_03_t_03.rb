def task_3(text)
  time = []
  text.each_line do |st|
    next unless st.include?('Calling core with action')

    time.push(Time.parse(st.chomp))
  end
  time.length == 2 ? (time[1] - time[0]).to_s : '0'
end
