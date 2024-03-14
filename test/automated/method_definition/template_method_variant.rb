require_relative '../automated_init'

context "Method Definition" do
  context "Template Method Variant" do
    example = Controls::TemplateMethod::Variant.example

    method_defined = example.respond_to?(:some_method)

    test "Defines the method" do
      assert(method_defined)
    end
  end
end
