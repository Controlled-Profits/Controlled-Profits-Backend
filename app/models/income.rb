class Income < ApplicationRecord
  belongs_to :business
  validates :period_sales, presence: true
  validates :cash_collections, presence: true
  validates :credit_sales, presence: true
  validates :entry_date, presence: true
end
