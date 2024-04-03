require_relative '../automated_init'

context "Template Method" do
  context "Not Implemented" do
    context "Prepended" do
      example = Controls::TemplateMethod::Prepended.example

      test "Is not an error" do
        refute_raises(NoMethodError) do
          example.some_method
        end
      end
    end
  end
end
