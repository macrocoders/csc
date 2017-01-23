module StockLocationsHelper
  def stock_location_action_links(stock_location)
    [content_tag(:li, link_to('Редактировать', edit_references_stock_location_path(stock_location)))].join.html_safe
  end    
end
