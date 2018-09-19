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
