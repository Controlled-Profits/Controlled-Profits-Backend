require 'serializers/business_serializers'
class V1::BusinessesController < V1::APIController
  before_action :authenticate_user!
  before_action :set_business, only: [:show, :update, :index_data, :destroy]
  before_action :user_owns_business?, only: [:show, :update, :index_data, :destroy]

  #Returns a list of all the authenticated users businesses
  def index
    @user_businesses = Business.where({user_id: current_user.id})
    render json: JSONAPI::Serializer.serialize(@user_businesses, is_collection: true)
  end

  #Returns a list of all a given businesses data, with optional date filtering
  def index_data
    #TODO: Add each relevant table to these queries as they are added
    @incomes = Income.where(business_data_query_hash)
    render json: JSONAPI::Serializer.serialize(@incomes, is_collection: true)
  end

  def create
    @business = Business.new(business_params)
    @business[:user_id] = current_user.id
    @business[:tier] = 1
    if @business.save
      render json: JSONAPI::Serializer.serialize(@business, meta: {message: 'New business has been created successfully.'})
    else 
      render json: JSONAPI::Serializer.serialize(@business, meta: {errors: @business.errors.full_messages}), status: :bad_request
    end
  end

  def update
    if @business.update(business_params)
      render json: JSONAPI::Serializer.serialize(@business, meta: {message: 'New business has been created successfully.'})
    else 
      render json: JSONAPI::Serializer.serialize(@business, meta: {errors: @business.errors.full_messages}), status: :bad_request
    end
  end

  def show
    render json: JSONAPI::Serializer.serialize(@business)
  end

  def destroy
    if @business.destroy 
      render json: {data: {meta: {message: 'Business deleted successfully.'}}}
    else 
      render json: {data: {meta: {errors: ['There was an error deleting that business.']}}}, status: :bad_request
    end
  end

  private 

  def business_params
    params.permit(:name, :naics, :sic, :ein)
  end
end
