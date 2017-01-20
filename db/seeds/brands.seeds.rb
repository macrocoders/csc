class << self
  def create_brands
    ['Nokia', 'Samsung', 'Lg', 'Sony', 'Apple'].each  do |brand_title| 
      brand = Brand.new(title: brand_title)
      message =  brand.save ? "brand - #{brand.title} created" : "#{brand.errors.full_messages}"
      p message                  
    end    
  end  
end  

create_brands
