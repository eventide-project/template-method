module TemplateMethod
  module Macro
    def template_method_macro(method_name, &implementation)
      implementation ||= -> { nil }

      inherit = false
      concrete_implementation_exists = method_defined?(method_name, inherit)
      if concrete_implementation_exists
        return
      end

      define_method(method_name) do |*args, **kwargs, &blk|
        if defined?(super)
          return super(*args, **kwargs, &blk)
        end

        implementation.(*args, **kwargs, &blk)
      end
    end
    alias :template_method :template_method_macro

    def template_method_variant_macro(method_name)
      template_method_macro(method_name) do
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
