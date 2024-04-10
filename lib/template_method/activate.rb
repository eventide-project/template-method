module TemplateMethod
  def self.activate(target_class=nil)
    target_class ||= Object
    target_class.extend(TemplateMethod::Macro)
  end

  def self.activated?(target_class=nil)
    target_class ||= Object

    subject = subject_class(target_class)

    Macro.macro_methods.each do |mthd|
      if not subject.respond_to?(mthd)
        return false
      end
    end

    true
  end

  def self.subject_class(subject)
    case subject
    when Module, Class
      subject
    else
      subject.class
    end
  end
end
