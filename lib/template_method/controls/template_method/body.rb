module TemplateMethod
  module Controls
    module TemplateMethod
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
    end
  end
end
