# chokidar "**/*.rb" -c "bundle exec ruby study/7_class.rb"

class ClassName
  attr_reader :name_r
  attr_writer :name_w
  attr_accessor :name_rw
  CLASS_CONST_VALUE = 0
  CLASS_FREEZE_VALUE = 'string'.freeze

  def initialize(name = 'name')
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

  def self.self_log
    p self
    p self.class_method
  end

  def self_log
    p self
    # p self.class_method # error can't call class method
  end

  p 'can exec code here'
end

p '---'
p ClassName::CLASS_CONST_VALUE #=> 0
ClassName::CLASS_CONST_VALUE = 1 # output warning but can set new value
p ClassName::CLASS_CONST_VALUE #=> 1
# p ClassName::CLASS_FREEZE_VALUE #=> 0 # why don't work? maybe shouldn't be able to change
# ClassName::CLASS_FREEZE_VALUE = 'freeze?'
# p ClassName::CLASS_FREEZE_VALUE #=> 0

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

ClassName.self_log # Class
c.self_log # Instance

class Product # super
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def say_info
    p @name
    p @price
  end
end

class Dvd < Product #sub
  attr_reader :movie_time

  def initialize(name, price, movie_time)
    super(name, price)
    @movie_time = movie_time
  end

  def say_info # override
    super
    p @movie_time
  end
end

ppp = Product.new('super computer', '$1000')
ddd = Dvd.new('super computer', '$1000', '60m')

ppp.say_info
ddd.say_info

class PublicLevel
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def public_m
    p @name
  end

  private # can't specify receiver

  def private_m
    p @name
  end

  protected

  def protected_m
    p @name
  end
end

class PublicLevelSub < PublicLevel
  def can_call_private_in_sub
    private_m
  end
end

pub = PublicLevel.new('text')
pub.public_m
# pub.protected_m # error
# pub.private_m #error

pub_sub = PublicLevelSub.new('text sub')
pub_sub.can_call_private_in_sub

class ManyVariableType
  @name = 'Class Instance Variable'
  @@name = 'Share Sub Class Class variable'

  def self.name
    @name
  end

  def self.name2
    @@name
  end

  def initialize(str)
    @name = str
  end

  def get_name
    @name
  end
end

$GLOBAL_VALUE = 'GLOBAL'
class ManyVariableTypeSub < ManyVariableType
  def global
    p $GLOBAL_VALUE
  end
end


m = ManyVariableType.new('string')

p ManyVariableType.name
p m.get_name

ms = ManyVariableTypeSub.new('string sub')
p ManyVariableTypeSub.name # nil don't share super to sub class (@name)
p ManyVariableTypeSub.name2 # share super to sub class (@@name)
p ms.get_name # string sub

ms.global

