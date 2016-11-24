class << self
  Faker::Config.locale = 'ru'
  
  def create_client
    client = Client.new(name: Faker::Name.name_with_middle,
                        phone: Faker::PhoneNumber.cell_phone,
                        email: Faker::Internet.email,
                        city: Faker::Address.city,
                        street: Faker::Address.street_name,
                        hous: Faker::Number.between(1, 100),
                        flat: Faker::Number.between(1, 100),
                        legal_status: [true, false].sample,
                        is_buyer: [true, false].sample,
                        is_supplier: [true, false].sample  
                        )
    message = client.save ? 'client created' : "#{client.errors.full_messages}"
    p message
  end  
end  

50.times do
  create_client
end
