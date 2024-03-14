require_relative '../../automated_init'

context "Template Method" do
  context "Method With Body" do
    example = Controls::TemplateMethod::Body.example
    response = example.some_method

    implemented = !response.nil?

    test do
      assert(implemented)
    end
  end
end
