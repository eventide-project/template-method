require_relative '../../automated_init'

context "Template Method" do
  context "Method With Body" do
    context "Binding" do
      example_class = Class.new do
        include TemplateMethod
        template_method :some_method do
          return self
        end
      end
      example = example_class.new

      bound = example.some_method.equal?(example)

      test "Bound to the instance" do
        assert(bound)
      end
    end
  end
end
