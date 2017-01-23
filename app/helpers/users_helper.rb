module UsersHelper
  def user_action_links(user)
    [content_tag(:li, link_to('Редактировать', edit_references_user_path(user)))].join.html_safe
  end       
end
