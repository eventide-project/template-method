require_relative '../automated_init'

context "Template Method" do
  context "Already Implemented When Macro Invoked" do
    example = Controls::TemplateMethod::Implemented::AlreadyImplemented.example
    response = example.some_method

    overridden = response.nil?

    test "Not overridden" do
      refute(overridden)
    end
  end
end
