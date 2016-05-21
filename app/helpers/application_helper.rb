module ApplicationHelper
  def check_fav(condition)
     i_class = 'fa fa-'
     i_class += condition ? 'check text-success' : 'times text-danger'
    content_tag :i,'',class: i_class
  end

  def check_active_link(path)
    current_page?(path) ? 'active' : '' 
  end
end
