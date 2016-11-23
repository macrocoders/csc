class References::UsersController < ApplicationController
  before_filter :init_user, only: %w(edit destroy update destroy)
  
  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end
    
  def new
    @user = User.new
  end  
  
  def edit
  end
  
  def update
    if @user.update(user_params_without_password)
      redirect_to references_users_url, notice: 'Данные сотрудника успешно изменены.'
    else
      render :edit
    end
  end  
  
  def destroy
    @user.destroy
    redirect_to references_users_url, notice: 'Сотрудник успешно удалён.'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to references_users_url, notice: 'Сотрудник успешно создан.'
    else
      render :new
    end     
  end        
  
  private
  
  def init_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :middle_name, :email, :password)
  end
  
  def user_params_without_password
    params.require(:user).permit(:first_name, :last_name, :middle_name, :email)
  end        
end
