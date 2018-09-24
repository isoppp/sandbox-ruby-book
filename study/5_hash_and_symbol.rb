# chokidar "**/*.rb" -c "bundle exec ruby study/5_hash_and_symbol.rb"

hash1 = {hoge: 'hoge'}
p hash1

hash2 = {:hoge => 'hoge'}
p hash2

p hash1 == hash2 # 2つは記法の差
p hash1.delete(:hoge)
p hash1

p :symbol.class
p :synbol.object_id

def hash_sample(some, exist: true) # キーワード引数
  [some, exist]
end

# p hash_sample # error
p hash_sample(0)
p hash_sample(0, exist: false)

hash3 = {
  hoge: 'hoge',
  fuga: 'fuga',
  num: 0,
}

p hash3.keys
p hash3.values

p hash3.has_key?(:hoge) == hash3.key?(:hoge)
p hash3.has_key?(:hoge) == hash3.include?(:hoge)
p hash3.has_key?(:hoge) == hash3.member?(:hoge)

p **hash3

hash4 = {
  **hash3,
  hash4: 'hash4!',
  hoge: 'hooge',
}

p hash4

def hash_sample2(some, options = {})
  drink = options[:drink]
  food = options[:food]
  p drink, food
end

hash_sample2(0, {drink: 'drink here!', food: 'food here!'})

def hash_sample3(some, **others)
  p others
end

hash_sample3(0, num1: 1, num2: 3, num3: 4)

hash5 = {arr: 'arr!', hash: 'hash!'}

p hash5
p hash5.to_a
p hash5.to_a.to_h

add_initial = Hash.new('hello')
a = add_initial[:a]
b = add_initial[:b]

p [a, b]
a.upcase!
p [a, b]

add_initial = Hash.new {'hello'}
a = add_initial[:a]
b = add_initial[:b]

p [a, b]
a.upcase!
p [a, b]

p %s!free string symbol!

p %i(symbol array)

p 'hello'.to_sym
p 'hello'.to_sym.to_s

# p maybe_nil # error
p maybe_nil ||= 10

p !!0 #=> boolに変換する true
