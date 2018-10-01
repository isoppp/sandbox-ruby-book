# chokidar "**/*.rb" -c "bundle exec ruby study/8_module_search_order.rb"

module ModuleA
  def to_s
    "<ModuleA> #{super}"
  end
end

module ModuleB
  def to_s
    "<ModuleB> #{super}"
  end
end

class ClassSuper
  def to_s
    "<ClassSuper> #{super}"
  end
end

class ClassSub <  ClassSuper
  include ModuleA
  include ModuleB

  def to_s
    "<ClassSub> #{super}"
  end
end

class ClassSubPre < ClassSuper
  prepend ModuleA
  prepend ModuleB

  def to_s
    "<ClassSubPre> #{super}"
  end
end


ccc = ClassSub.new
p ccc.to_s # "<ClassSub> <ModuleB> <ModuleA> <ClassSuper> #<ClassSub:0x00007fcc28077b90>"

p ClassSub.ancestors # [ClassSub, ModuleB, ModuleA, ClassSuper, Object, Kernel, BasicObject]
p ClassSubPre.ancestors # [ModuleB, ModuleA, ClassSubPre, ClassSuper, Object, Kernel, BasicObject]

