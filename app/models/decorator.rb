module Decorator
  def header_name
    model_name.human.pluralize.titleize
  end
end
