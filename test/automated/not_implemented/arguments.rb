require_relative '../automated_init'

context "Template Method" do
  context "Not Implemented" do
    context "Method Arguments" do
      some_argument = 'some argument'
      some_other_argument = 'some other argument'

      example = Controls::TemplateMethod.example
      response = example.some_method(some_argument, some_other_argument)

      not_implemented = response.nil?

      test do
        assert(not_implemented)
      end
    end
  end
end
