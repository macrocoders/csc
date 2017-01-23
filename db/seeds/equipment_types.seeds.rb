class << self
  def create_equipent_types
    ['Мобильные телефоны', 'Планшеты', 'Ноутбуки'].each  do |title| 
      equipent_type = EquipmentType.new(title: title)
      message =  equipent_type.save ? "equipent type - #{equipent_type.title} created" : "#{equipent_type.errors.full_messages}"
      p message                  
    end    
  end  
end  

create_equipent_types
