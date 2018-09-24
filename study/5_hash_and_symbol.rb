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

