# chokidar "**/*.rb" -c "bundle exec ruby study/4.2_array.rb"

arr = [1, 2, 3]
p arr
p arr.size
p arr.size === arr.length

arr[3] = 4
p arr

arr << 5
p arr

arr.delete_at(1)
p arr

p arr.delete_at(100) # nil が返る

a1, a2 = arr
p a1
p a2

p 14.divmod(3) # 商と余りを配列で返す

p arr
p arr[arr.size - 1]
p arr[arr.size - 1] == arr[-1]
p arr[-1] == arr.last
p arr.first

p arr.values_at(0, 1) # 0番目と1番目
p arr[1, 3] # 1つ目の要素から3つ

p arr.delete(3) # delete elem == 3 / return 3

arr1 = [0, 1, 2]
arr2 = [2, 3, 4]

# p arr1.concat(arr2) # eq arr1 = ... overwrite arr1
p arr1 + arr2 # don't overwrite arr1

p arr1 | arr2 #=> [0, 1, 2, 3, 4] 和集合 重複を削除しつつ結合
p arr1 - arr2 #=> [0, 1] 差集合 元の配列から重複を削除
p (arr1 & arr2) #=> [2] 積集合 共通要素を返す

# 詳細な集合演算をする時はSetを使うと良い（詳細省略）
require 'set'
set1 = Set.new(arr1)
set2 = Set.new(arr2)

p set1 | set2
p set1 - set2
p set1 & set2

val, *arr = 1, 2, 3, 4, 5
p val, arr #=> 1 / [2,3,4,5]

p arr.push(*arr) # [2,3,4,5,2,3,4,5]

def sample (var1, var2, *vars)
  p var1, var2, vars
end

sample(1, 2, 3, 4, 5) #=> 1 / 2 / [3, 4, 5]

p [100, 2, *arr, 3]

p [1, 2, 3] == [1, 2, 3]
p [1, 2, 3] == [0, 1, 2]

p %w(str1, str2, str3) # ["str1,", "str2,", "str3"] 文字列配列を簡単に作る

p 'string'.chars
p 'string1,string2'.split(',')

p Array.new(5)
p Array.new(5, 0)
p Array.new(10) {|n| n % 3 + 1} # [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

refer_var = Array.new(5, 'def')
refer_var[0].upcase!
p refer_var # ["DEF", "DEF", "DEF", "DEF", "DEF"] 参照の差に注意

refer_var2 = Array.new(5) {'def'} # ブロック引数は省略
refer_var2[0].upcase!
p refer_var2 # ["DEF", "def", "def", "def", "def"] 参照の差に注意


# each(/map) * index

arr = [3, 2, 1]
arr.each {|n| p n}
arr.each_with_index {|n, i| p n, i}
p arr.map {|n| n}
p arr.map.with_index {|n, i| n.to_s + i.to_s} # .with_indexは色々な所で使える Enumeratorクラスのインスタンスメソッドだから

p arr.map.with_index(10) {|n, i| n.to_s + i.to_s} # indexの初期値の指定

arr.each do |n; sum | # ローカル変数を定義
  sum = 10
  sum += n
  p sum
end

arr = [[0, 1], [5, 4], [9, 8]]
arr.each do |one, two| # ここでばらして取れる
  p one, two
end

arr.each.with_index do |(one, two), i| # indexが絡む場合
  p i.to_s + ': ' + one.to_s + two.to_s
end

p 'break'
arr = [1, 2, 3, 4, 5].shuffle
arr.each do |n|
  next if n < 3 # skip
  p n

  break if n == 5 # 終了
end

# times
5.times {|n| p n}
10.upto(14) {|n| p n}
14.upto(10) {|n| p n}
0.step(10, 5) {|n| p n}
