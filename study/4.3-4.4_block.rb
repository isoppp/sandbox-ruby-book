# chokidar "**/*.rb" -c "bundle exec ruby study/4.3-4.4_block.rb"

numbers = [1, 2, 3, 4]
p numbers

numbers.each do |n|
  p n
end

numbers.delete_if do |n|
  n.odd?
end

p numbers

numbers.each {|n| p n}

p numbers.map {|n| n * 2} # =.collect

p numbers.select {|n| n == 2}
p numbers.reject {|n| n == 2}

p numbers.find {|n| n == 4} # 最初に真になった要素を返す

p numbers.inject(0) {|result, n| result + n} # 初回のresultはinjectの引数

p numbers.map(&:even?) # 括弧になる/ブロック引数で内部呼び出し時に引数がなくメソッドを一回呼び出す以外の処理がない場合に使える


