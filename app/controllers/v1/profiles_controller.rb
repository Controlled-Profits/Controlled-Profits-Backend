require 'serializers/business_serializers'
class V1::ProfilesController < V1::APIController
  before_action :authenticate_user!

  def show
    render json: JSONAPI::Serializer.serialize(current_user)
  end
end
