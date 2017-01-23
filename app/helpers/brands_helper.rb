module BrandsHelper
  def brand_action_links(brand)
    [content_tag(:li, link_to('Редактировать', edit_references_brand_path(brand)))].join.html_safe
  end
end
