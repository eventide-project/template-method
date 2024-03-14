module TemplateMethod
  module Controls
    module Extended
      def self.example
        Example.new
      end

      class Example
        extend ::TemplateMethod
      end
    end
  end
end

