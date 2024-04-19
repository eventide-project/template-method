module TemplateMethod
  module Controls
    module TemplateMethod
      module Variant
        def self.example
          Example.new
        end

        class Example
          include ::TemplateMethod
          template_method! :some_method
        end

        module Implemented
          def self.example
            Example.new
          end

          class Example
            include ::TemplateMethod
            template_method! :some_method

            def some_method
              'some value'
            end
          end
        end
      end
    end
  end
end
