class BusinessDataSerializer
  def serialize(obj, args = {})
    obj_attributes = obj.attributes
    if args.has_key?(:is_collection) && args.is_collection
      
    else 
      result = {
        data: {
          type: obj.model_name.human,
          id: obj.id,
          attributes: obj_attributes
        }
      }
    end

    if args.has_key?(:section)
      selected_keys = case args.section.downcase
      when "income_statement"
        %w(period_sales cash_collections credit_sales cogs marketing 
        direct_labor distribution vpie salaries benefit_admin office_lease office_supplies
        utilities transportation online_expenses insurance training accounting_and_legal
        advertising marketing_development other fpie interest_paid depreciation_and_amortizaton
        tax_rate dividends)
      when "balance_sheet"
        %w(cash accounts_receivable inventory prepaid_expenses
        other_current_assets ppe furniture_and_fixtures leasehold_improvements
        land_and_buildings other_fixed_assets accumulated_depreciation goodwill
        accounts_payable interest_payable taxes_payable deferred_revenue short_term_notes
        current_debt other_current_liabilities bank_loans_payable notes_payable_to_stockholders
        other_long_term_debt common_stock paid_in_surplus retained_earnings)
      when "sales_and_marketing"
        %w(prospects number_of_sales marketing_spend grand_total_units)
      when "financial_roi"
        %w(airp_debt airp_equity airc_for_financing corp_tax_rate)
      else 
        obj.attributes.keys
      end

      new_attributes = {}
      obj_attributes.each do |key, val|
        if selected_keys.include? key
          
        end
      end
    end


  end
end