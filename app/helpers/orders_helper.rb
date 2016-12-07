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
     content_tag(:li, link_to('Редактировать', edit_documents_order_path(order))),
     content_tag(:li, link_to('Удалить', 
                              documents_order_path(order), 
                              method: :delete, 
                              data: { confirm: "Вы действительно хотите удалить заказ?" })),
     content_tag(:li, link_to('Переместить', 
                              new_documents_order_transfer_path(order_id: order),
                              data: {target: "#modalDialog", 
                                     toggle: "modal", 
                                     remote: false, 
                                     title: 'Перемещение'}))    
    ].join.html_safe
         
  end       
end
