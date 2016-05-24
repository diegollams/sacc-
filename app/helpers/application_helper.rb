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
    lbl = label || klass.header_name # hmm, maybe it's better to pass the Class as label, kinda smells 
    link_to path, class: check_active_link(path) do
      [icn, lbl].join.html_safe
    end
  end

  def gender_color(gender)
    # do not judge me
    g = gender || 'genderless'
    content_tag :i, '', class: "fa fa-#{g} fa-fw", style: "color: #{g == 'female' ? 'Pink' : 'LightSkyBlue'};"
  end

  def circle_button(path = '#not_set', icon = 'exclamation-triangle', type = 'default', tooltip = nil)
    link_to(path, class: "btn btn-#{type} btn-circle", data: { toggle: 'tooltip', placement: :bottom }, title: tooltip) do
      content_tag(:i, '', class: "fa fa-#{icon} fa-fw")
    end
      # Text label not cool
  end

  def pluralize_without_count(count, noun, text = nil) # to be tested, the 0 case is not correct
    if count != 0
      count == 1 ? "an #{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

  # delete button, for reference until fixed
  # = link_to model_path(model), method: :delete, data: { confirm: t('.confirm', default: t("helpers.links.confirm", default: 'Are you sure?')), toggle: 'tooltip', placement: :bottom }, title: t('.destroy', default: t("helpers.links.destroy")), class: 'btn btn-danger btn-circle' do
  #   %i{class: 'fa fa-trash fa-fw'}
end
