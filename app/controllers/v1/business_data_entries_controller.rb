require 'serializers/business_data_serializer'
class V1::BusinessDataEntriesController < V1::APIController
  before_action :authenticate_user!
  before_action :set_business
  before_action :user_owns_business?

  def index
    @bde = Array.wrap(BusinessDataEntry.where(business_data_query_hash))
    render json: BusinessDataSerializer.serialize(@bde, serializer_args_hash)
  end

  def create
    #TODO: Ensure that two entries of the same type are not submitted in the same month ..?
    @bde = BusinessDataEntry.new(bde_params)
    @bde[:business_id] = @business.id
    @bde[:entry_date] = Time.now.utc.end_of_month
    if @bde.save
      render json: BusinessDataSerializer.serialize(Array.wrap(@bde))
    else
      render json: { errors: @bde.errors.full_messages }
    end
  end

  def show
    @bde = Array.wrap(BusinessDataEntry.find(params[:id]))
    render json: BusinessDataSerializer.serialize(@bde, serializer_args_hash)
  end

  def update 
    @bde = BusinessDataEntry.find(params[:id])
    if @bde.update_attributes(bde_params)
      render json: BusinessDataSerializer.serialize(Array.wrap(@bde))
    else
      render json: { errors: @bde.errors.full_messages }
    end
  end

  def destroy
    @bde = BusinessDataEntry.find(params[:id])
    @bde.destroy if !@bde.nil?
  end

  private

  #Returns arguments as hash for BDE serializer function, if they are present
  def serializer_args_hash
    result = {}
    #TODO: Should probably safety check these somewhere
    result[:entry_type] = params[:entry_type] if params[:entry_type].present? 
    result[:section] = params[:section] if params[:section].present?
    return result
  end

  def bde_params
    params.permit(:period_sales,
    :cash_collections,
    :credit_sales,
    :cogs,
    :marketing,
    :direct_labor,
    :distribution,
    :vpie,
    :salaries,
    :benefit_admin,
    :office_lease,
    :office_supplies,
    :utilities,
    :transportation,
    :online_expenses,
    :insurance,
    :training,
    :accounting_and_legal,
    :advertising,
    :marketing_development,
    :other,
    :fpie,
    :ebitda,
    :interest_paid,
    :depreciation_and_amortization,
    :tax_rate,
    :dividends,
    :cash,
    :accounts_receivable,
    :inventory,
    :prepaid_expenses,
    :other_current_assets,
    :ppe,
    :furniture_and_fixtures,
    :leasehold_improvements,
    :land_and_buildings,
    :other_fixed_assets,
    :accumulated_depreciation,
    :goodwill,
    :accounts_payable,
    :interests_payable,
    :taxes_payable,
    :deferred_revenue,
    :short_term_notes,
    :current_debt,
    :other_current_liabilities,
    :bank_loans_payable,
    :notes_payable_to_stockholders,
    :other_long_term_debt,
    :common_stock,
    :paid_in_surplus,
    :retained_earning,
    :prospects,
    :number_of_sales,
    :marketing_spend,
    :grand_total_unit,
    :airp_debt,
    :airp_equity,
    :airc_for_financing,
    :corp_tax_rate)
  end
end