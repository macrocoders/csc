class << self
  Faker::Config.locale = 'ru'
  
  def create_order
    order = Order.new(warehouse_id: Warehouse.find_or_create_by(title: 'Основной склад').id,
                        job_type: Faker::Number.between(0, 1),
                        client_id: Client.all.sample(1).first.id,
                        model_id: Model.all.sample(1).first.id,
                        imei: '123456789012345',
                        serial_number: 'SN1234567890',
                        user_id: User.first.id,
                        defect: ['Не включается', 'Не заряжается', 'Заменить тачскрин'].sample,
                        completeness: 'АКБ, СЗУ, Коробка',
                        description: Faker::Lorem.sentence 
                        )
    message = order.save ? 'order created' : "#{order.errors.full_messages}"
    p message
  end  
end  

150.times do
  create_order
end
