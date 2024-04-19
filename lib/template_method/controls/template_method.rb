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
    end
  end
end
