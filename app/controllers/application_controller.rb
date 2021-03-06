

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :init
  
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_type
    devise_parameter_sanitizer.for(:account_update ) << :user_type
  end

  def update_sanitized_params
  	devise_parameter_sanitizer.for(:sign_up) << :user_type
  	devise_parameter_sanitizer.for(:account_update ) << :user_type
  end
end
