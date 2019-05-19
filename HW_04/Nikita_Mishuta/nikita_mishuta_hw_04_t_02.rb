require 'yaml'

def task_4_2(input)
  return {} if input.empty?

  yaml_hash = YAML.safe_load(input)
  yaml_hash.map { |key, value| [key.to_sym => new_hash(value)] }.flatten
end

def new_hash(hash)
  result_hash = {}
  result_hash[:db] = hash['database'] if hash.key?('database')
  result_hash[:user] = hash['username'] if hash.key?('username')
  result_hash[:password] = hash['password'] if hash.key?('password')
  result_hash[:magic_number] = calculate_number(hash['pool'], hash['timeout'])
  result_hash
end

def calculate_number(pool, timeout)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool.to_i * timeout.to_i
end
