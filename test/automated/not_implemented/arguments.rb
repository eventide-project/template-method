require_relative '../automated_init'

context "Template Method" do
  context "Method Arguments" do
    some_argument = 'some argument'
    some_other_argument = 'some other argument'

    example = Controls::TemplateMethod.example

    test "Does not raise an ArgumentError" do
      refute_raises(ArgumentError) do
        example.some_method(some_argument, some_other_argument)
      end
    end
  end
end
