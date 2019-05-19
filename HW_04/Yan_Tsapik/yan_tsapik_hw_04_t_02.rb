require 'yaml'
def task_4_2(input)
  bgi_hash = YAML.safe_load(input)
  arr = []
  return arr if bgi_hash.nil?

  bgi_hash.each do |small_key, small_hash|
    arr << { small_key.to_sym => build_hash(small_hash) }
  end
  arr
end

def eval_magic_number(small_hash)
  pool = small_hash.fetch('pool', 1)
  timeout = small_hash.fetch('timeout', 1000)
  pool * timeout
end

def build_hash(small_hash)
  d_b = small_hash['database']
  us = small_hash['username']
  ps = small_hash['password']
  mn = eval_magic_number(small_hash)

  h = {}
  h[:db] = d_b unless d_b.nil?
  h[:user] = us unless us.nil?
  h[:password] = ps unless ps.nil?
  h[:magic_number] = mn unless mn.nil?

  h
end
