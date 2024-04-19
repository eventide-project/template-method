require_relative '../automated_init'

context "Template Method" do
  context "Prior Implementation" do
    example = Controls::TemplateMethod::Implemented::Prior.example
    response = example.some_method

    overridden = response.nil?

    test "Not overridden" do
      refute(overridden)
    end
  end
end
