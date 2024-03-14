module TemplateMethod
  def self.activate(target_class=nil)
    target_class ||= Object

    return if target_class.ancestors.include?(TemplateMethod::Macro)

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
    if [Module, Class].include?(subject)
      return subject
    else
      return subject.class
    end
  end
end
