# chokidar "**/*.rb" -c "bundle exec ruby study/7_class.rb"

class ClassName
  attr_reader :name_r
  attr_writer :name_w
  attr_accessor :name_rw
  CLASS_CONST_VALUE = 0

  def initialize(name='name')
    puts 'init'
    @name_r = name
    @name_w = name
    @name_rw = name
  end

  def hello_r
    p "hello #{@name_r}"
  end

  def hello_w
    p "hello #{@name_w}"
  end

  def hello_rw
    p "hello #{@name_rw}"
  end

  def self.class_method
    p 'class_method called!'
    p CLASS_CONST_VALUE
  end
end

c = ClassName.new
c.hello_r
p c.name_r
c.hello_w
c.name_w = 'hoge'
c.hello_w

c.hello_rw
c.name_rw = 'rw'
c.hello_rw

ClassName.class_method
# ClassName.hello_w # error
