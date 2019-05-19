require 'yaml'

def task_4_2(data)
  return data if data.empty?

  yaml_hash = YAML.safe_load(data)
  yaml_hash.map { |key, value| [key.to_sym => select(value)] }.flatten
end

def select(hash)
  res_hash = {}
  res_hash[:db] = hash['database'] if hash.key?('database')
  res_hash[:user] = hash['username'] if hash.key?('username')
  res_hash[:password] = hash['password'] if hash.key?('password')
  res_hash[:magic_number] = magic_num(hash['pool'], hash['timeout'])
  res_hash
end

def magic_num(pool = 1, timeout = 1000)
  timeout = 1000 if timeout.nil?
  pool = 1 if pool.nil?
  pool * timeout
end
