require_relative '../automated_init'

context "Template Method Variant" do
  context "Method Arguments" do
    some_argument = 'some argument'
    some_other_argument = 'some other argument'

    example = Controls::TemplateMethod::Variant.example

    begin
      example.some_method(some_argument, some_other_argument)
    rescue TemplateMethod::Error
    rescue ArgumentError => argument_error
    end

    test "Does not raise an ArgumentError" do
      assert(argument_error.nil?)
    end
  end
end
