# ========================================================================== #
# Serializes a given BuisinessDataEntry object array as json, sorted by entry dates
# meeting jsonapi.org v1.0 spec. Call as BusinessDataSerializer::serialize(business_data_entry, {args})
# Arg options:
# :section = "income_statement" || "balance_sheet" || "sales_and_marketing" || "financial_roi"
#  - * Serializes only the given section in each entry
# 
# :type = "actual" || "adjusted"
# - * Serializes only the given type of entries
# ------------------------------------------------------------------------
# JSON result format:
# {
# data: [
#   {
#     id: "1"
#     type: "business_data_entry"
#     entry_type: "(actual || adjusted)"
#     entry_date: "2017-09-30T19:34:55.000Z"
#     business_id: "5"
#     income_statement: {...}
#     balance_sheet: {...}
#     sales_and_marketing: {...}
#     financial_roi: {...}
#   }, 
#   {
#     ...
#   },
#   ...
# ]}
#
#
#
# ========================================================================== #

class BusinessDataSerializer
  def self.serialize(obj_array, args = {})
    if obj_array.nil? || obj_array.count == 0 then return {data: Array.new} end

    result_data = []
    data_sections = %w(income_statement balance_sheet sales_and_marketing financial_roi)

    if args.key?(:section) && data_sections.include?(args[:section].downcase)
      data_sections = [args[:section].downcase]
    end

    #Roll each section into into its parent, and then roll those into the data object array
    obj_array.each do |obj| 
      next if args.key?(:entry_type) && obj.entry_type != args[:entry_type]
      obj_data = {
        id: obj.id,
        type: "business_data_entry",
        entry_type: obj.entry_type,
        entry_date: obj.entry_date,
        business_id: obj.business_id
      }
      data_sections.each do |section|
        selected_keys = case section
        when "income_statement" #Income Statement Group
          %w(period_sales cash_collections credit_sales cogs marketing 
          direct_labor distribution vpie salaries benefit_admin office_lease office_supplies
          utilities transportation online_expenses insurance training accounting_and_legal
          advertising marketing_development other fpie interest_paid depreciation_and_amortization
          tax_rate dividends entry_date)
        when "balance_sheet" #Balance Sheet Group
          %w(cash accounts_receivable inventory prepaid_expenses
          other_current_assets ppe furniture_and_fixtures leasehold_improvements
          land_and_buildings other_fixed_assets accumulated_depreciation goodwill
          accounts_payable interest_payable taxes_payable deferred_revenue short_term_notes
          current_debt other_current_liabilities bank_loans_payable notes_payable_to_stockholders
          other_long_term_debt common_stock paid_in_surplus retained_earnings entry_date)
        when "sales_and_marketing" #Sales and marketing group
          %w(prospects number_of_sales marketing_spend grand_total_units entry_date)
        when "financial_roi" #Financial rates of interest group
          %w(airp_debt airp_equity airc_for_financing corp_tax_rate entry_date)  
        else 

        end
        section_data = {}
        selected_keys.each {|key| section_data[key] = obj[key]}
        obj_data[section] = section_data
      end
      result_data.push(obj_data)
    end 

    result_obj = {
      data: result_data
    }

    result_obj.to_json rescue {data: Array.new}
  end
end