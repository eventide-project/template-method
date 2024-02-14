module TemplateMethod
  def self.included(cls)
    activate(cls)
  end

  def self.extended(cls)
    activate(cls)
  end
end
