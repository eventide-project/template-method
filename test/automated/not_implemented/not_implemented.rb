require_relative '../automated_init'

context "Template Method" do
  context "Not Implemented" do
    example = Controls::TemplateMethod.example
    response = example.some_method

    not_implemented = response.nil?

    test do
      assert(not_implemented)
    end
  end
end
