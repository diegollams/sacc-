module ApplicationHelper
  def check_fav(condition)
     i_class = 'fa fa-'
     i_class += condition ? 'check text-success' : 'times text-danger'
    content_tag :i,'',class: i_class
  end
end
