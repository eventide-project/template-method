require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    example = Controls::Extended.example

    test "Activated" do
      assert(TemplateMethod.activated?(example))
    end
  end
end
