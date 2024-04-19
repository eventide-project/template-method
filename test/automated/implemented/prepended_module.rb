require_relative '../automated_init'

context "Template Method" do
  context "Implemented By Prepended Module" do
    example = Controls::TemplateMethod::Implemented::PrependedModule.example
    response = example.some_method

    implemented = !response.nil?

    test do
      assert(implemented)
    end
  end
end
