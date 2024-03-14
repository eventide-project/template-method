require_relative '../automated_init'

context "Activation" do
  context "Activated Predicate" do
    context "Activated" do
      example = Controls::Clean.example
      example_class = example.class

      TemplateMethod.activate(example_class)

      activated = TemplateMethod.activated?(example)

      test do
        assert(activated)
      end
    end

    context "Not Activated" do
      example = Object.new

      activated = TemplateMethod.activated?(example)

      test do
        refute(activated)
      end
    end
  end
end
