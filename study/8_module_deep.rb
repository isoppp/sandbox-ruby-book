# chokidar "**/*.rb" -c "bundle exec ruby study/8_module_deep.rb"

# original class that include Comparable
class Tempo
  include Comparable

  attr_reader :bpm

  def initialize(bpm)
    @bpm = bpm
  end

  def <=>(other) # must need this for Comparable!
    if other.is_a?(Tempo)

      bpm <=> other.bpm
    else
      nil
    end
  end

  def inspect # override
    "#{bpm}bpm"
  end
end

t_120 = Tempo.new(120)
t_180 = Tempo.new(180)

p t_120 > t_180
p t_120 <= t_180
p t_120 == t_180

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
p tempos
p tempos.sort


module NameChanger
  def change_name # bad pattern
    @name = 'Alice'
  end

  def change_name_self
    self.name_self = 'Alice'
  end
end

class User
  include NameChanger

  attr_reader :name
  attr_accessor :name_self

  def initialize(name)
    @name = name
    @name_self = name
  end
end

user = User.new('John')
p user.name #=> John

user.change_name
p user.name #=> Alice

p user.name_self
user.change_name_self
p user.name_self #=> Alice

module Loggable
  def log(text)
    puts "[LOG] #{text}"
    text
  end
end
s = 'abc'
# s.log('outpput') # error
s.extend(Loggable) # after extend to instance
s.log('output')
