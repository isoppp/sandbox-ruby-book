# chokidar "**/*.rb" -c "bundle exec ruby study/10_proc_deep.rb"

# several call way
add_proc = Proc.new {|a, b| a + b}

p add_proc.call(10, 20)
p add_proc.yield(10, 20)
p add_proc.(10, 20)
p add_proc[10, 20]
p add_proc === [10, 20]

def judge(age)
  adult = Proc.new {|n| n > 20}
  child = Proc.new {|n| n < 20}

  case age
  when adult
    'otona'
  when child
    'kodomo'
  else
    'hatachi'
  end
end

p judge(25)
p judge(18)
p judge(20)

reverse_proc = Proc.new {|s| p s.reverse}

['Ruby', 'Java', 'Perl'].map(&reverse_proc)

split_proc = :split.to_proc
p split_proc

p split_proc.call('a-b-c-d e')
p split_proc.call('a-b-c-d e', '-')
p split_proc.call('a-b-c-d e', '-', 3)

# .map(&:hoge) のショートハンドは :splitをto_procメソッドを呼び出してそのProcを実行している、to_procが実行できる必要があるので引数を取れない
p ['a-b-c-d e'].map(&:split)

# clojure
def generate_proc(array)
  counter = 0
  Proc.new do
    counter += 10

    array << counter
  end
end

values = []
sample_proc = generate_proc(values)

sample_proc.call
p values

sample_proc.call
p values

# proc and lambda diff

def proc_return
  f = Proc.new {|n| return n * 10} # Procの場合元のメソッドを抜ける
  ret = [1,2,3].map(&f)
  "ret: #{ret}"
end

def lambda_return
  f = ->(n) { return n * 10} # lambdaの場合lambdaの中でreturnする
  ret = [1,2,3].map(&f)
  "ret: #{ret}"
end


p proc_return #=> 10
p lambda_return #=> "ret: [10,20,30]"

