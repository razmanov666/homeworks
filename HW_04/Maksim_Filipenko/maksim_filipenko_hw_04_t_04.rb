def task_4_4(str)
  str.downcase.delete(' ') == str.downcase.delete(' ').reverse if check(str)
end

def check(str)
  str.class == String
end
