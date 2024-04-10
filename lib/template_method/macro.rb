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

    def template_method_macro(method_name, &implementation)
      implementation ||= proc { |*| nil }

      ancestors_without_prepended_modules = ancestors.drop_while do |ancestor|
        ancestor != self
      end

      concrete_implementation_exists = ancestors_without_prepended_modules.any? do |ancestor|
        ancestor.method_defined?(method_name, false) ||
          ancestor.private_method_defined?(method_name, false)
      end

      if concrete_implementation_exists
        return
      end

      template_method_module.define_method(method_name, &implementation)
    end
    alias :template_method :template_method_macro

    def template_method_variant_macro(method_name)
      template_method_macro(method_name) do |*|
        raise TemplateMethod::Error, "Implementation is required (Method name: #{method_name})"
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
