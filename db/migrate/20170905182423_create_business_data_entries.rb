class CreateBusinessDataEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :business_data_entries do |t|
      t.decimal :period_sales
      t.decimal :cash_collections
      t.decimal :credit_sales
      t.decimal :cogs
      t.decimal :marketing
      t.decimal :direct_labor
      t.decimal :distribution
      t.decimal :vpie
      t.decimal :salaries
      t.decimal :benefit_admin
      t.decimal :office_lease
      t.decimal :office_supplies
      t.decimal :utilities
      t.decimal :transportation
      t.decimal :online_expenses
      t.decimal :insurance
      t.decimal :training
      t.decimal :accounting_and_legal
      t.decimal :advertising
      t.decimal :marketing_development
      t.decimal :other
      t.decimal :fpie
      t.decimal :ebitda
      t.decimal :interest_paid
      t.decimal :depreciation_and_amortization
      t.decimal :tax_rate
      t.decimal :dividends
      t.decimal :cash
      t.decimal :accounts_receivable
      t.decimal :inventory
      t.decimal :prepaid_expenses
      t.decimal :other_current_assets
      t.decimal :ppe
      t.decimal :furniture_and_fixtures
      t.decimal :leasehold_improvements
      t.decimal :land_and_buildings
      t.decimal :other_fixed_assets
      t.decimal :accumulated_depriciation
      t.decimal :goodwill
      t.decimal :accounts_payable
      t.decimal :interests_payable
      t.decimal :taxes_payable
      t.decimal :deferred_revenue
      t.decimal :short_term_notes
      t.decimal :current_debt
      t.decimal :other_current_liabilities
      t.decimal :bank_loans_payable
      t.decimal :notes_payable_to_stockholders
      t.decimal :other_long_term_debt
      t.decimal :common_stock
      t.decimal :paid_in_surplus
      t.decimal :retained_earnings
      t.decimal :prospects
      t.decimal :number_of_sales
      t.decimal :marketing_spend
      t.decimal :grand_total_units
      t.decimal :airp_debt
      t.decimal :airp_equity
      t.decimal :airc_for_financing
      t.decimal :corp_tax_rate

      t.string :type

      t.integer :business_id
      t.datetime :entry_date

      t.timestamps
    end
  end
end
