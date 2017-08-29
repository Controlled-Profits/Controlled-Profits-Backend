class IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_owns_business?
  before_action :set_income, only: [:update, :show, :destroy]

  def index
    @business_incomes = Income.where({business_id: @business.id})
    render json: @business_incomes
  end

  def create
    @income = Income.new(income_params)
    @income[:business_id] = params[:bid]
    #@income[:entry_date] = DateTime.parse(params[:entry_date]).to_i
    if @income.save
      render json: {status: 'Success', message: 'New income entry has been created successfully', income: @income}
    else 
      render json: {status: 'Failure', errors: @income.errors.full_messages}, status: :bad_request
    end
  end

  def update
    if @income.update(income_params)
      render json: {status: 'Success', message: 'Income entry has been updated successfully', income: @income}
    else 
      render json: {status: 'Failure', errors: @income.errors.full_messages}, status: :bad_request
    end
  end

  def show
    render json: @income
  end

  def destroy
  end

  private 

  def set_income
    @income = Income.find(params[:income_id])
  end

  def income_params
    params.permit(:period_sales, :cash_collections, :credit_sales, :entry_date)
  end
end
