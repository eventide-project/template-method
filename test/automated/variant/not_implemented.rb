require_relative '../automated_init'

context "Template Method Variant" do
  context "Not Implemented" do
    example = Controls::TemplateMethod::Variant::NotImplemented.example

    test "Raises an error" do
      assert_raises(TemplateMethod::Error) do
        example.some_method
      end
    end
  end
end
