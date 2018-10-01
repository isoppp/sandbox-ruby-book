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
