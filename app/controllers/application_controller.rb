class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #Override permitted devise params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :active_business_id, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :email, :active_business_id, :password, :password_confirmation, :current_password])
  end
end
