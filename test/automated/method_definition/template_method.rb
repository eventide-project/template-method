require_relative '../automated_init'

context "Method Definition" do
  context "Template Method" do
    example = Controls::TemplateMethod.example

    method_defined = example.respond_to?(:some_method)

    test "Defines the method" do
      assert(method_defined)
    end
  end
end
