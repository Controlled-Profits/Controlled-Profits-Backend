class V1::BusinessDataEntryController < V1::APIController
  before_action :authenticate_user!
  before_action :set_business
  before_action :user_owns_business?

  def index

  end

  def create
    @bde = BusinessDataEntry.new(bde_params)
    @bde[:business_id] = @business.id
    if @bde.save
      render json: JSONAPI::Serializer.serialize(@bde)
    else
      render 
    end
  end

  #Individual Financial Data Sections' show methods

  def income_statement

  end

  def balance_sheet

  end

  def sales_marketing

  end

  def financial_roi 

  end

  private

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
    :accumulated_depriciation,
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