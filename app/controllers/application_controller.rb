#

class ApplicationController < ActionController::Base
  #require 'common/CommonHelpers.rb'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :init
  
  
  #def init
  #	puts "start"
 # 	puts ::CommonHelpers.new.get_wi_published.to_s
  #	puts "end"
  #end

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
