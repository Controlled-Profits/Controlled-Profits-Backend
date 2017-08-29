class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_owns_business?, only: [:show, :update, :destroy]
  def index
    @user_businesses = Business.where({user_id: current_user.id})
    render json: @user_businesses
  end

  def create
    p @params
    @business = Business.new(business_params)
    @business[:user_id] = current_user.id
    @business[:tier] = 1
    if @business.save
      render json: {status: 'Success', message: 'New business has been created successfully.', business: @business}
    else 
      render json: {status: 'Failure', errors: @business.errors.full_messages}, status: :bad_request
    end
  end

  def update
    if @business.update(business_params)
      render json: {status: 'Success', message: 'Business has been updated successfully.', business: @business}
    else
      render json: {status: 'Failure', errors: @business.errors.full_messages}, status: :bad_request
    end
  end

  def show
    if !@business.nil?
      render json: @business
    else 
      render json: {status: 'Failure', errors: ['No such business found.']}, status: 404
    end
  end

  private 

  def business_params
    params.permit(:name, :naics, :sic, :ein)
  end
end
