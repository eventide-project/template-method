module TemplateMethod
  module Macro
    def template_method_module
      @template_method_module ||= include_template_method_module
    end

    def include_template_method_module
      mod = Module.new
      include mod
      mod
    end

    def template_method_macro(method_name, &default_implementation)
      default_implementation ||= proc { |*| nil }

      default_method_name = :"_#{method_name}_default_implementation"

      template_method_module.define_method(default_method_name, &default_implementation)

      template_method_module.define_method(method_name) do |*args, **kwargs, &block|
        if defined?(super)
          super(*args, **kwargs, &block)
        else
          public_send(default_method_name, *args, **kwargs, &block)
        end
      end
    end
    alias :template_method :template_method_macro

    def template_method_variant_macro(method_name)
      location = caller_locations(1, 1).first
      file, line = location.path, location.lineno

      template_method_macro(method_name) do |*|
        raise TemplateMethod::Error, "Implementation is required (Method name: #{method_name}, Class: #{self.class.name}, Declaration: #{file}:#{line})"
      end
    end
    alias :template_method! :template_method_variant_macro

    def self.macro_methods
      [
        'template_method',
        'template_method!'
      ]
    end
  end
end
