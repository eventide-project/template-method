require_relative '../automated_init'

context "Template Method" do
  context "Subsequent Implementation" do
    example = Controls::TemplateMethod::Implemented::Subsequent.example
    response = example.some_method

    overridden = response.nil?

    test "Not overridden" do
      refute(overridden)
    end
  end
end
