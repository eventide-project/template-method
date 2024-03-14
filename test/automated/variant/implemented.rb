require_relative '../automated_init'

context "Template Method Variant" do
  context "Implemented" do
    example = Controls::TemplateMethod::Variant.example
    response = example.some_method

    implemented = !response.nil?

    test do
      assert(implemented)
    end
  end
end
