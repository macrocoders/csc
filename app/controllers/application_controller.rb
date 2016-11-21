class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  layout :layout_by_resource
  
  protected
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :middle_name])
  end
end
