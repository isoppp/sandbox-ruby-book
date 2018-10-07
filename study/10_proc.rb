# chokidar "**/*.rb" -c "bundle exec ruby study/10_proc.rb"

hello_proc = Proc.new do # or Proc.new {'Hello'}
  p 'Hello!'
end

hello_proc.call

add_proc = Proc.new {|a, b| p a + b}
add_proc.call(10, 20)

add_proc_def = Proc.new {|a = 1, b = 2| p a + b}
add_proc_def.call(3)

kernel_proc = proc {|a, b| p a + b}
kernel_proc.call(1, 2)

p 'arity', kernel_proc.arity

def greeting(&block)
  p 'ohayou'
  p block.class # Proc instance
  text = block&.call('hello')
  p text
  p 'oyasumi'
end

greeting do |text|
  text
end

repeat_proc = Proc.new {|text| text * 2}
# greeting(repeat_proc) # error
greeting(&repeat_proc) # need '&'


# proc----
Proc.new {|a, b| a + b}
proc {|a, b| a + b}

# proc lambda
->(a, b) {a + b}
lambda {|a, b| a + b}

# diff
add_proc = Proc.new {|a, b| a.to_i + b.to_i}
add_proc.call(10) # no error
add_proc.call(10, 20, 100) # no error

add_lambda = ->(a, b) {a.to_i + b.to_i}
# add_lambda.call(10) # error!
# add_lambda.call(10, 20, 30) # error!

p add_proc.class
p add_proc.lambda?
p add_lambda.class
p add_lambda.lambda?
