class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :password, :password_confirmation])
  end

    def user_owns_business?
      @business = Business.find(params[:bid])
      unless current_user && !@business.nil? && current_user.id == @business.user_id
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        return
      end
    end

end
