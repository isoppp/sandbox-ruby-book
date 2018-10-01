# chokidar "**/*.rb" -c "bundle exec ruby study/8_module.rb"

module Greeter
  def hello
    'hello'
  end
end

# greeter = Greeter.new # error because it's module

module Loggable
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable # load module

  def title
    log 'title is called'
    'A great movie'
  end
end

class User
  include Loggable # import instance method

  def name
    log 'name is called'
    'Alice'
  end
end

product = Product.new
product.title

user = User.new
user.name

class ExtendSample
  extend Loggable # import class method

  def self.example
    log 'example is called'
  end
end

ExtendSample::example
ExtendSample.example

p Product.include?(Loggable)
p Product.included_modules # include modules
p Product.ancestors # include super class

p user.is_a?(User)
