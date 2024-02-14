require_relative '../automated_init'

context "Activation" do
  context "Activate" do
    example = Controls::Clean.example
    example_class = example.class

    TemplateMethod.activate(example_class)

    context "Macro Methods" do
      TemplateMethod::Macro.macro_methods.each do |mthd|
        test mthd do
          assert(example_class.respond_to?(mthd))
        end
      end
    end
  end
end
