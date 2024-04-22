module TemplateMethod
  module Controls
    module TemplateMethod
      module Implemented
        def self.example
          Example.new
        end

        class Example
          include ::TemplateMethod
          template_method :some_method

          def some_method
            'some value'
          end
        end

        module Prior
          def self.example
            Example.new
          end

          class Example
            def some_method
              'some value'
            end

            include ::TemplateMethod
            template_method :some_method
          end
        end

        module Subsequent
          def self.example
            Example.new
          end

          module Concrete
          end

          class Example
            include Concrete
            include ::TemplateMethod
            template_method :some_method
          end

          Concrete.define_method(:some_method) do
            'some value'
          end
        end

        module Module
          def self.example
            Example.new
          end

          class Example
            include ::TemplateMethod
            template_method :some_method

            module SomeModule
              def some_method
                'some value'
              end
            end
            include SomeModule
          end
        end

        module PrependedModule
          def self.example
            Example.new
          end

          class Example
            module PrependedModule
              def self.included(cls)
                cls.class_exec do
                  include ::TemplateMethod

                  prepend SomeMethod

                  template_method :some_method do
                    'some value'
                  end
                end
              end

              module SomeMethod
                def some_method
                  return super
                rescue NoMethodError
                  return nil
                end
              end
            end
            include PrependedModule
          end
        end
      end
    end
  end
end
