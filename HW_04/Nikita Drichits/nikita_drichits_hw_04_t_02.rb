require 'yaml'

def main_keys_to_sym(msg)
  YAML.safe_load(msg).keys.map(&:to_sym)
end

def sub_keys_and_pairs_ruse(msg)
  YAML.safe_load(msg).values.map do |item|
    item.each_with_object({}) do |(key, value), hash|
      hash[key.to_sym] = value if key == 'password'
      hash[:db] = value if key == 'database'
      hash[:user] = value if key == 'username'
      hash[:magic_number] = create_magic_number(item['pool'], item['timeout'])
      hash
    end
  end
end

def create_magic_number(pool, timeout)
  pool = 1 if pool.nil?
  timeout = 1000 if timeout.nil?
  pool * timeout
end

def task_4_2(msg)
  if msg.empty?
    {}
  else
    Hash[main_keys_to_sym(msg).zip(sub_keys_and_pairs_ruse(msg))] \
      .map { |key, value| { key => value } }
  end
end
