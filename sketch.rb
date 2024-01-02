module TemplateMethod
  def self.included(cls)
    cls.extend Macro
  end

  module Macro
    def template_method(name, &implementation)
      implementation ||= -> { nil }

      # Avoid overwriting an existing method on self
      inherit = false
      concrete_implementation_exists = method_defined?(name, inherit)
      if concrete_implementation_exists
        return
      end

      define_method(name) do |*args, **kwargs, &blk|
        if defined?(super)
          return super(*args, **kwargs, &blk)
        end

        implementation.(*args, **kwargs, &blk)
      end
    end
  end
end

module SomeModule
  def self.included(cls)
    cls.class_exec do
      include TemplateMethod

      template_method :some_method
    end
  end
end

# Concrete method overrides template method (testing Ruby, but included for completeness)
class SomeClass
  include SomeModule

  def some_method
    "some concrete result"
  end
end

# Concrete method is not defined
class SomeOtherClass
  include SomeModule
end

# Concrete method is defined in self BEFORE template_method is invoked
class YetAnotherClass
  def some_method
    "some concrete result"
  end

  include SomeModule
end

module SomeModuleWithImplementation
  def some_method
    "some module concrete result"
  end
end

# Concrete method is defined higher in inheritance hierarchy than template method
class StillYetAnotherClass
  include SomeModule
  include SomeModuleWithImplementation
end

puts "SomeClass"
pp SomeClass.new.some_method

puts
puts "SomeOtherClass"
pp SomeOtherClass.new.some_method

puts
puts "YetAnotherClass"
pp YetAnotherClass.new.some_method

puts
puts "StillYetAnotherClass"
pp StillYetAnotherClass.new.some_method

puts
puts "END"
