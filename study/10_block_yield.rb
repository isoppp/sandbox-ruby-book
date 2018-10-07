# chokidar "**/*.rb" -c "bundle exec ruby study/10_block_yield.rb"

def greeting
  puts 'ohayou'

  if block_given?
    yield 'hello'
  end

  puts 'konnnitiha'
end

greeting

greeting do |text|
  puts 'oyasumi'
  puts text
end

def greeting_block(&block)
  puts 'ohayou'

  block&.call('hello')

  puts 'konnnitiha'
end

greeting_block

greeting_block do |text|
  puts 'oyasumi'
  puts text
end

def greeting_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんは']
  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  greeting_common(texts, &block)
end

def greeting_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
  puts texts[2]
end

greeting_ja do |text|
  text * 2
end

greeting_en do |text|
  text * 3
end

def greeting_multi_args(&block)
  text =
    if block.arity == 1
      yield 'how are you'
    elsif block.arity == 2
      yield 'how', 'are', 'you'
    end
  puts text
end

greeting_multi_args do |text|
  [text]
end

greeting_multi_args do |text, text2|
  [text, text2]
end
