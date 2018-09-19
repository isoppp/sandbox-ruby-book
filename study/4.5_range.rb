# chokidar "**/*.rb" -c "bundle exec ruby study/4.5_range.rb"

p (1..5).to_a
p (1..5).include?(5)  # true
p (1...5).to_a
p (1...5).include?(5) # false

arr = [1,2,3,4,5]
p arr[0..2]

str = 'strings'
p str[0..2]

p 0 <= 101 && 101 <= 100
p (0..100).include?(101)

p (1..10).to_a
p ('a'..'f').to_a

p [*1..5]  # splat展開

(1..5).each { |n| p n}
(1..5).step(2) { |n| p n}
