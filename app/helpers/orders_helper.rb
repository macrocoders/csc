module OrdersHelper
  def job_types
    [['Платный', Order::PAY_TYPE], ['Гарантийный', Order::GARANTY_TYPE]]
  end
  
  def order_work_status(order)
    case order.work_status
    when "accepted"
      'Принято'
    when 'transferred_to_engineer'
      'Передано инженеру'
    when 'diagnosed'
      'Диагностировано'
    else 
      '-'
    end        
  end
  
  def order_status_color(order)
    case order.work_status
    when 'accepted'
      '#FF734C'
    when 'transferred_to_engineer'
      '#FFAF48'
    when 'diagnosed'
      '#FFF4C0'
    else 
      '#fff'
    end        
  end
  
  def order_action_links(order)
    [content_tag(:li, link_to('Смотреть', documents_order_path(order))),
     content_tag(:li, link_to('Редактировать', edit_documents_order_path(order)))].join.html_safe
     #link_to(, documents_order_path(order), method: :delete, class: 'btn btn-app-small btn-danger', data: { confirm: "Вы действительно хотите удалить заказ?" })
  end       
end
