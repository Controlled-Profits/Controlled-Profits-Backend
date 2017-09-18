# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(firstname: 'Test', lastname: 'User', email: 'test@aol.com', active_business_id: 1, password: 'Password123', password_confirmation: 'Password123')

business1 = Business.create(user_id: user1.id, name: 'Test Business', naics: '00000', sic: '0000', ein: '79-7979797', tier: 1)

# Actual business income data entry
bde1 = BusinessDataEntry.create(
  business_id: business1.id,
  entry_date: Time.now.utc.end_of_month,
  entry_type: "actual",
  total_revenues: 1350000.00,
  cogs: 594000.00,
  marketing: 38250.00,
  direct_labor: 15000.00,
  distribution: 18000.00,
  vpie: nil,
  salaries: 120000.00,
  benefit_admin: 18972.00,
  office_lease: 12000.00,
  office_supplies: 1000.00,
  utilities: 5400.00,
  transportation: 6800.00,
  online_expenses: 2700.00,
  insurance: 2448.00,
  training: 6000.00,
  accounting_and_legal: 2400.00,
  advertising: 1000.00,
  marketing_development: 500.00,
  other: 0,
  fpie: 0,
  ebitda: 505530.00,
  interest_paid: 3500.00,
  donations: 0
  depreciation_and_amortization: 2500.00,
  tax_rate: 0.34,
  dividends: 50000.00,
  cash: 125000.00,
  accounts_receivable: 110000.00,
  inventory: 88000.00,
  prepaid_expenses: 25000.00,
  other_current_assets: 10000.00,
  ppe: 15000.00,
  furniture_and_fixtures: 10000.00,
  leasehold_improvements: 1000.00,
  land_and_buildings: 167000.00,
  other_fixed_assets: 44000.00,
  accumulated_depreciation: 25000.00,
  goodwill: 280000.00,
  accounts_payable: 50000.00,
  interests_payable: 125000.00,
  taxes_payable: 15000.00,
  deferred_revenue: 22000.00,
  short_term_notes: 50000.00,
  current_debt: 50000.00,
  other_current_liabilities: 38000.00,
  bank_loans_payable: 90000.00,
  notes_payable_to_stockholders: 75000.00,
  other_long_term_debt: 38000.00,
  common_stock: 44000.00,
  paid_in_surplus: 0,
  retained_earnings: 253000.00,
  prospects: 50000.00,
  number_of_sales: 10200.00,
  marketing_spend: 38250.00,
  grand_total_units: 14500.00,
  airp_debt: 0.08,
  airp_equity: 0.04,
  airc_for_financing: 0.12,
  corp_tax_rate: 0.34
)

 
# Predicted business income entry for the following month,
# to be created by front end profit driver calcs
bde2 = BusinessDataEntry.create(
  business_id: business1.id,
  entry_date: Time.now.utc.end_of_month,
  entry_type: "adjusted",
  total_revenues: 1397500.00,
  credit_sales: 50000.00,
  cogs: 846043.00,
  marketing: 54480.00,
  direct_labor: 21365.00,
  distribution: 25638.00,
  vpie: 700.00,
  salaries: 118800.00,
  benefit_admin: 18782.00,
  office_lease: 11880.00,
  office_supplies: 990.00,
  utilities: 5346.00,
  transportation: 6732.00,
  online_expenses: 2673.00,
  insurance: 2424.00,
  training: 5940.00,
  accounting_and_legal: 2376.00,
  advertising: 990.00,
  marketing_development: 495.00,
  other: 0,
  fpie: 700,
  ebitda: 944550.00,
  interest_paid: 3500.00,
  depreciation_and_amortization: 2500.00,
  tax_rate: 0.34,
  dividends: 50000.00,
  cash: 125000.00,
  accounts_receivable: 110000.00,
  inventory: 88000.00,
  prepaid_expenses: 25000.00,
  other_current_assets: 10000.00,
  ppe: 15000.00,
  furniture_and_fixtures: 10000.00,
  leasehold_improvements: 1000.00,
  land_and_buildings: 167000.00,
  other_fixed_assets: 44000.00,
  accumulated_depreciation: 25000.00,
  goodwill: 280000.00,
  accounts_payable: 50000.00,
  interests_payable: 125000.00,
  taxes_payable: 15000.00,
  deferred_revenue: 22000.00,
  short_term_notes: 50000.00,
  current_debt: 50000.00,
  other_current_liabilities: 38000.00,
  bank_loans_payable: 90000.00,
  notes_payable_to_stockholders: 75000.00,
  other_long_term_debt: 38000.00,
  common_stock: 44000.00,
  paid_in_surplus: 0,
  retained_earnings: 253000.00,
  prospects: 50500.00,
  number_of_sales: 11847.00,
  marketing_spend: 38250.00,
  grand_total_units: 18568.00,
  airp_debt: 0.08,
  airp_equity: 0.04,
  airc_for_financing: 0.12,
  corp_tax_rate: 0.34
)

profit_drivers_1 = ProfitDriver.create([{
  name: "prospects",
  business_id: business1.id,
  percent: 0.01,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "conversions",
  business_id: business1.id,
  percent: 0.15,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "volume",
  business_id: business1.id,
  percent: 0.05,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "price",
  business_id: business1.id,
  percent: 0.03,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "productivity",
  business_id: business1.id,
  percent: 0.01,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "efficiency",
  business_id: business1.id,
  percent: 0.01,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
},
{
  name: "frequency",
  business_id: business1.id,
  percent: 0.07,
  var_cost: 100.00,
  fixed_cost: 100.00,
  entry_date: Time.now.utc.end_of_month
}])






