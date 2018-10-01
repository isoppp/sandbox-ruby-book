# chokidar "**/*.rb" -c "bundle exec ruby study/8_module_others.rb"

# === namespace
module User
  class Man
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end
end

man = User::Man.new('name')
p man.name

# ===

module Loggable # recommend to use module because need not to save state
  def self.log(text)
    puts "[LOG] #{text}"
  end
end

Loggable.log('hoge')

module Loggable2
  class << self
    def log(text) # same self.log
      puts "[LOG] #{text}"
    end
  end
end

class Sample
  include Loggable
end

Loggable2.log('text')

# Sample.log('text') # error

module Loggable3
  def log(text) # same self.log
    puts "[LOG] #{text}"
  end

  module_function :log # can use module & class
end

class Sample3
  include Loggable3

  def title(text)
    log('title')
    text
  end
end

s = Sample3.new
s.title('text') # works
Loggable3.log('333')

module CONST_MODULE
  PREFIX = '[LOG]'.freeze

  def self.log(text)
    puts "#{PREFIX} #{text}"
    text
  end
end

p CONST_MODULE::PREFIX
p CONST_MODULE.log('hoge')

module LIKE_SINGLETON
  class << self
    attr_accessor :aaa, :bbb
    @aaa = ''
    @bbb = ''
  end
end

LIKE_SINGLETON.aaa = 'hoge'
LIKE_SINGLETON.bbb = 'fuga'
p LIKE_SINGLETON.aaa, LIKE_SINGLETON.bbb

require 'singleton'
class ProperSingleton
  include Singleton
  attr_accessor :aaa, :bbb

  def initialize
    @aaa = ''
    @bbb = ''
  end
end

# config = ProperSingleton.new # can't new
config = ProperSingleton.instance
config.aaa = 'hoge'
config.bbb = 'fuga'
p config.aaa
p config.object_id

config2 = ProperSingleton.instance
p config2.aaa
p config2.bbb
p config2.object_id
