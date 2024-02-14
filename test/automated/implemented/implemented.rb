require_relative '../automated_init'

context "Template Method" do
  context "Implemented" do
    example = Controls::TemplateMethod::Implemented.example
    response = example.some_method

    implemented = !response.nil?

    test do
      assert(implemented)
    end
  end
end
