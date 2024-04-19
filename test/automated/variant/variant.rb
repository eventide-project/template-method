require_relative '../automated_init'

context "Template Method Variant" do
  example = Controls::TemplateMethod::Variant.example

  test "Raises an error" do
    assert_raises(TemplateMethod::Error) do
      example.some_method
    end
  end
end
