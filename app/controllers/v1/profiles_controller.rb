require 'serializers/business_serializers'
class V1::ProfilesController < V1::APIController
  before_action :authenticate_user!

  def show
    #Ensures info is up to date outside of helper method if it is updated
    @user = User.find(current_user.id)
    render json: JSONAPI::Serializer.serialize(@user)
  end

  def update
    @user = User.find(current_user.id)
    if(@user.update_attributes(profile_params))
      render json: JSONAPI::Serializer.serialize(@user)
    else 
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  private

  def profile_params
    params.permit(:firstname, :lastname, :active_business_id)
  end
end
