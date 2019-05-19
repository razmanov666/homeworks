require 'yaml'

def task_4_2(input)
  if input.empty?
    input
  else
    new_inp = YAML.safe_load(input)
    new_inp.map { |key, value| [key.to_sym => value_selection(value)] }.flatten
  end
end

def default_magic_number(default_value)
  default_value['pool'] = 1 if default_value['pool'].nil?
  default_value['timeout'] = 1000 if default_value['timeout'].nil?
  default_value['pool'].to_i * default_value['timeout'].to_i
end

def value_selection(sel_value)
  res_value = {}
  res_value[:db] = sel_value['database'] if sel_value.key?('database')
  res_value[:user] = sel_value['username'] if sel_value.key?('username')
  res_value[:password] = sel_value['password'] if sel_value.key?('password')
  res_value[:magic_number] = default_magic_number(sel_value)
  res_value
end
