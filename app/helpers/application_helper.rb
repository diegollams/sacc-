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
    lbl = label || klass.model_name.human.pluralize.titleize
    link_to path, class: check_active_link(path) do
      [icn, lbl].join.html_safe
    end
  end
end
