require 'serializers/business_serializers.rb'
class V1::PDriversController < V1::APIController
  before_action :authenticate_user!

  def index
    
  end

end