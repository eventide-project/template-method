module TemplateMethod
  module Controls
    module TemplateMethod
      def self.example
        Example.new
      end

      class Example
        include ::TemplateMethod
        template_method :some_method
      end

      module Body
        def self.example
          Example.new
        end

        class Example
          include ::TemplateMethod
          template_method :some_method do |*|
            :something
          end
        end
      end

      module Implemented
        def self.example
          Example.new
        end

        class Example
          include ::TemplateMethod
          template_method :some_method

          def some_method
            "some concrete result"
          end
        end

        module AlreadyImplemented
          def self.example
            Example.new
          end

          class Example
            def some_method
              "some concrete result"
            end

            include ::TemplateMethod
            template_method :some_method
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
                "some module concrete result"
              end
            end
            include SomeModule
          end
        end
      end

      module Variant
        def self.example
          Example.new
        end

        class Example
          include ::TemplateMethod
          template_method! :some_method

          def some_method
            'some concrete result'
          end
        end

        module NotImplemented
          def self.example
            Example.new
          end

          class Example
            include ::TemplateMethod
            template_method! :some_method
          end
        end
      end
    end
  end
end
