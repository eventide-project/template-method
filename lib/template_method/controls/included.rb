module TemplateMethod
  module Controls
    module Included
      def self.example
        Example.new
      end

      class Example
        include ::TemplateMethod
      end
    end
  end
end
