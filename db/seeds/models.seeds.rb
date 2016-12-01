class << self
  Faker::Config.locale = 'ru'
  
  def create_models
    Brand.all.each do |brand|
      5.times do 
        model = Model.new(brand_id: brand.id,
                          title: [Faker::Name.suffix, Faker::Number.between(100, 1000)].join(''))
        message = model.save ? 'model created' : "#{model.errors.full_messages}"
        p message                  
      end  
    end  
  end  
end  

create_models
