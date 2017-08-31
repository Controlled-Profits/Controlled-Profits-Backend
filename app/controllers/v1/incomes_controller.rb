require 'serializers/business_serializers'
class V1::IncomesController < V1::APIController
  before_action :authenticate_user!
  before_action :set_business
  before_action :user_owns_business?
  before_action :set_income, only: [:update, :show, :destroy]

  def index
    @business_incomes = Income.where(business_data_query_hash)
    render json: JSONAPI::Serializer.serialize(@business_incomes, is_collection: true)
  end

  def create
    @income = Income.new(income_params)
    @income[:business_id] = params[:business_id]
    if @income.save
      render json: JSONAPI::Serializer.serialize(@income, meta: {message: 'New income entry has been created successfully.'})
    else 
      render json: JSONAPI::Serialize.serialize(@income, meta: {errors: @income.errors.full_messages}), status: :bad_request
    end
  end

  def update
    if @income.update(income_params)
      render json: JSONAPI::Serializer.serialize(@income, meta: {message: 'Income entry has been updated successfully.'})
    else 
      render json: JSONAPI::Serializer.serialize(@income, meta: {errors: @income.errors.full_messages}), status: :bad_request
    end
  end

  def show
    render json: JSONAPI::Serializer.serialize(@income)
  end

  def destroy
    if @income.destroy 
      render json: {data: {meta: {message: 'Income entry deleted successfully.'}}}
    else 
      render json: {data: {meta: {errors: ['There was an error deleting that income entry.']}}}, status: :bad_request
  end

  private 

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.permit(:period_sales, :cash_collections, :credit_sales, :entry_date)
  end
end
