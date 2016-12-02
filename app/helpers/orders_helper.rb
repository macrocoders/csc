module OrdersHelper
  def job_types
    [['Платный', Order::PAY_TYPE], ['Гарантийный', Order::GARANTY_TYPE]]
  end
  
  def work_status_s(order)
    case order.work_status
    when 'accepted'
      'Принято'
    when 'transferred_to_engineer'
      'Передано инженеру'
    when 'diagnosed'
      'Диагностировано'
    else 
      '-'
    end        
  end
  
  def work_status_color(order)
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
end
