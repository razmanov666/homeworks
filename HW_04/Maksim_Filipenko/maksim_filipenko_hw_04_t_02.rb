require 'yaml'

def task_4_2(input)
  return {} if input.empty?

  yaml = YAML.safe_load(input)

  result = yaml.map { |k, v| [k.to_sym => spl(v)] }
  result.flatten
end

def spl(hash)
  result = {}
  result[:db] = hash['database'] if hash.key?('database')
  result[:user] = hash['username'] if hash.key?('username')
  result[:password] = hash['password'] if hash.key?('password')
  result[:magic_number] = magic_num(hash)
  result
end

def magic_num(hash)
  pool = hash['pool'] || 1
  timeout = hash['timeout'] || 1000
  pool * timeout
end
