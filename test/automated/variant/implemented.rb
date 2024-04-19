require_relative '../automated_init'

context "Template Method Variant" do
  context "Implemented" do
    example = Controls::TemplateMethod::Variant::Implemented.example

    test "Does not raise an error" do
      refute_raises(TemplateMethod::Error) do
        example.some_method
      end
    end
  end
end
