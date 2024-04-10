require_relative '../automated_init'

context "Activation" do
  context "Subject Class" do
    context "Class" do
      example = Class.new
      subject = TemplateMethod.subject_class(example)

      test do
        assert(subject == example)
      end
    end

    context "Module" do
      example = Module.new
      subject = TemplateMethod.subject_class(example)

      test do
        assert(subject == example)
      end
    end

    context "Instance" do
      example_class = Class.new
      instance = example_class.new

      subject = TemplateMethod.subject_class(instance)

      test do
        assert(subject == example_class)
      end
    end
  end
end
