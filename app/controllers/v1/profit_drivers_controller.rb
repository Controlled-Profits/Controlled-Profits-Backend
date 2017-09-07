require 'serializers/business_serializers.rb'
require 'serializers/profit_drivers_serializer.rb'
class V1::ProfitDriversController < V1::APIController
  before_action :authenticate_user!
  before_action :set_business
  before_action :user_owns_business?

  def index
    @pdrivers = ProfitDriver.where(business_data_query_hash)
    
  end

  def create 
    errors = create_pdrivers_from_json(params[:data])
    if errors.empty?
      render json: {data: {meta: "Successfully saved all profit drivers."}}
    else 
      render json: { errors: errors }
    end
  end

  def show

  end

  def destroy

  end

  private 

  def pdriver_params
    params.permit(:data)
  end

  #Returns no errors if the profit driver submission is saved successfully
  #pdriver entries will be overwritten if they have the same entry month
  def create_pdrivers_from_json(pdriver_data)
    errors = []
    pdriver_names = %w(prospects conversions volume price productivity efficiency frequency)
    pdriver_childkeys = %w(percent fixed_cost var_cost)
    pdriver_hash = pdriver_data

    if pdriver_hash.nil? || pdriver_hash[:profit_drivers].nil?
      errors.push "Request is formatted incorrectly or does not contain profit drivers"
      return errors
    end

    #Try to create or update each profit driver
    pdriver_names.each do |name_str|
      #Skip profit driver update or save if it is not included in request data
      next unless pdriver_hash[:profit_drivers].key? name_str
      pdriver_vals = pdriver_hash[:profit_drivers][name_str] 

      #Skip if profit driver data does not contain all necessary keys
      next unless pdriver_childkeys.all? { |str| pdriver_vals.key? str }

      pct = pdriver_vals["percent"]
      fc = pdriver_vals["fixed_cost"]
      vc = pdriver_vals["var_cost"]
      ent_date = Time.now.utc.end_of_month

      #Allow only one profit driver entry per month
      pdriver = ProfitDriver.where({
        name: name_str, entry_date: ent_date, business_id: @business.id
      })
      if !pdriver.nil? && pdriver.count > 0
        pdriver.update(percent: pct, fixed_cost: fc, var_cost: vc)
      else 
        pdriver = ProfitDriver.new(
          name: name_str, percent: pct, fixed_cost: fc, var_cost: vc, 
          business_id: @business.id, entry_date: ent_date
        )
        if !pdriver.save
          errors += pdriver.errors.full_messages
        end
      end 
    end

    return errors
  end
end