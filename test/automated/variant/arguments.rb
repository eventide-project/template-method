require_relative '../automated_init'

context "Template Method Variant" do
  context "Not Implemented" do
    context "Arguments" do
      some_argument = 'some argument'
      some_other_argument = 'some other argument'

      example = Controls::TemplateMethod::Variant::NotImplemented.example

      test "Raises an error" do
        assert_raises(TemplateMethod::Error) do
          example.some_method(some_argument, some_other_argument)
        end
      end
    end
  end
end
