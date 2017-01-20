class << self
  def create_users
    pswd = '123456'
    user = User.new(first_name: 'Ivan',
                last_name: 'Admin',
                email: 'info@sc-stalker.ru',
                password: pswd,
                encrypted_password: pswd)
    p user.save ? "user - #{user.full_name} created" : user.errors.full_messages            
  end  
end  

create_users
