class V1::APIController < ApplicationController
  protected

  #Returns true if a user is authorized to access the business specified by a URL param
  def user_owns_business?
    unless current_user && !@business.nil? && current_user.id == @business.user_id
      p "Business ID: #{@business.user_id}"
      render json: {data: {meta: { errors: ['Not Authenticated'] }}}, status: :unauthorized
      return
    end
  end

  #Returns a hash for queries match all data by business id,
  #or by business id and date range if present and valid
  def business_data_query_hash
    if params[:start_date].present? && params[:end_date].present?
      start_date = params_to_date(params[:start_date])
      end_date = params_to_date(params[:end_date])
      if start_date && end_date && start_date < end_date
        return {business_id: @business.id, entry_date: start_date..end_date}
      end
    end
    return {business_id: @business.id}
  end

  # Returns a Date, or nil if the input isn't valid
  def params_to_date(date_str)
    Date.strptime(date_str, '%Y/%m/%d') rescue nil
  end
  
  def set_business
    #Business id parameter name may change if multiple id params are passed 
    business_id_param = params[:business_id].present? ? params[:business_id] : params[:id]
    @business = Business.find(business_id_param)
  end
end