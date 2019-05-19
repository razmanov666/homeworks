require 'yaml'

def task_4_2(input)
  return [] if input.empty?

  data = YAML.safe_load(input)
  parse(data)
end

def magic_num(pool, timeout)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool * timeout
end

def parse(data)
  out = []
  data.each do |key, value|
    hash = {}
    hash[:db] = value['database'] if value.key?('database')
    (hash[:user] = value['username']) if value.key?('username')
    hash[:password] = value['password'] if value.key?('password')
    hash[:magic_number] = magic_num(value['pool'], value['timeout'])
    out << [key.to_sym => hash]
  end
  out.flatten!
end
