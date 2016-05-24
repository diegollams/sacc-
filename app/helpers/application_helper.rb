module ApplicationHelper
  def check_fav(condition)
    i_class = 'fa fa-'
    i_class += condition ? 'check text-success' : 'times text-danger'
    content_tag :i, '', class: i_class
  end

  def check_active_link(path)
    current_page?(path) ? 'active' : '' 
  end

  def combo_link_to(path, icon = 'exclamation-triangle', label = nil, klass = nil)
    icn = content_tag(:i, '', class: "fa fa-#{icon} fa-fw")
    lbl = label || klass.model_name.human.pluralize.titleize # hmm, maybe it's better to pass the Class as label, kinda smells 
    link_to path, class: check_active_link(path) do
      [icn, lbl].join.html_safe
    end
  end

  def pluralize_without_count(count, noun, text = nil) # to be tested, the 0 case is not correct
    if count != 0
      count == 1 ? "an #{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

end
