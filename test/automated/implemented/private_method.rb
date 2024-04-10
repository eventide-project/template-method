require_relative '../automated_init'

context "Template Method" do
  context "Private Method" do
    example_class = Class.new do
      include TemplateMethod

      module SomePrivateMethod
        private def some_private_method
          'some value'
        end
      end
      include SomePrivateMethod

      template_method :some_private_method

      def some_public_method
        some_private_method
      end
    end

    example = example_class.new
    response = example.some_public_method

    overridden = response.nil?

    test "Not overridden" do
      refute(overridden)
    end
  end
end
