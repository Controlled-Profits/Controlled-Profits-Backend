# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170915213750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_data_entries", force: :cascade do |t|
    t.decimal "credit_sales"
    t.decimal "cogs"
    t.decimal "marketing"
    t.decimal "direct_labor"
    t.decimal "distribution"
    t.decimal "vpie"
    t.decimal "salaries"
    t.decimal "benefit_admin"
    t.decimal "office_lease"
    t.decimal "office_supplies"
    t.decimal "utilities"
    t.decimal "transportation"
    t.decimal "online_expenses"
    t.decimal "insurance"
    t.decimal "training"
    t.decimal "accounting_and_legal"
    t.decimal "advertising"
    t.decimal "marketing_development"
    t.decimal "other"
    t.decimal "fpie"
    t.decimal "ebitda"
    t.decimal "interest_paid"
    t.decimal "depreciation_and_amortization"
    t.decimal "tax_rate"
    t.decimal "dividends"
    t.decimal "cash"
    t.decimal "accounts_receivable"
    t.decimal "inventory"
    t.decimal "prepaid_expenses"
    t.decimal "other_current_assets"
    t.decimal "ppe"
    t.decimal "furniture_and_fixtures"
    t.decimal "leasehold_improvements"
    t.decimal "land_and_buildings"
    t.decimal "other_fixed_assets"
    t.decimal "accumulated_depreciation"
    t.decimal "goodwill"
    t.decimal "accounts_payable"
    t.decimal "interests_payable"
    t.decimal "taxes_payable"
    t.decimal "deferred_revenue"
    t.decimal "short_term_notes"
    t.decimal "current_debt"
    t.decimal "other_current_liabilities"
    t.decimal "bank_loans_payable"
    t.decimal "notes_payable_to_stockholders"
    t.decimal "other_long_term_debt"
    t.decimal "common_stock"
    t.decimal "paid_in_surplus"
    t.decimal "retained_earnings"
    t.decimal "prospects"
    t.decimal "number_of_sales"
    t.decimal "marketing_spend"
    t.decimal "grand_total_units"
    t.decimal "airp_debt"
    t.decimal "airp_equity"
    t.decimal "airc_for_financing"
    t.decimal "corp_tax_rate"
    t.string "entry_type"
    t.integer "business_id"
    t.datetime "entry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_revenues"
  end

  create_table "businesses", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "naics"
    t.string "sic"
    t.string "ein"
    t.integer "tier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profit_drivers", force: :cascade do |t|
    t.string "name"
    t.decimal "percent"
    t.decimal "var_cost"
    t.decimal "fixed_cost"
    t.integer "business_id"
    t.datetime "entry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.integer "tier", default: 1, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "active_business_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
