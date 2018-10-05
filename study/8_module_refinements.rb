# chokidar "**/*.rb" -c "bundle exec ruby study/8_module_refinements.rb"

module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

class User
  using StringShuffle # register but only enable this file

  def initialize(name)
    @name = name
  end

  def shuffled_name
    @name.shuffle
  end
end

user = User.new('Alice')
p user.shuffled_name
# p user.name.shuffle # error
