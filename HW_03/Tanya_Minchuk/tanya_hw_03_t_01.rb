def task_1(text)
  strings = text.split("\n")
  res = ''

  strings.each do |st|
    res = st if st.downcase.include?('error')
  end
  res
end
