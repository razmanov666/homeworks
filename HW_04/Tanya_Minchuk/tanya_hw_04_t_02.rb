require 'yaml'

def get_magic_number(pool, timeout)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool.to_i * timeout.to_i
end

def get_hash(value)
  res_hash = {}
  res_hash[:db] = value['database'] if value['database']
  res_hash[:user] = value['username'] if value['username']
  res_hash[:password] = value['password'] if value['password']
  res_hash[:magic_number] = get_magic_number(value['pool'], value['timeout'])
  res_hash
end

def task_4_2(input)
  return {} if input.empty?

  yaml_hash = YAML.safe_load(input)
  yaml_hash.map { |key, value| [key.to_sym => get_hash(value)] }.flatten
end
