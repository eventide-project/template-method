require_relative '../automated_init'

context "Template Method" do
  context "Implemented By A Module" do
    example = Controls::TemplateMethod::Implemented::Module.example
    response = example.some_method

    implemented = !response.nil?

    test do
      assert(implemented)
    end
  end
end
