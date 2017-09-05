require 'jsonapi-serializers'

class BaseSerializer 
  include JSONAPI::Serializer
end

class BusinessSerializer < BaseSerializer
  attribute :user_id
  attribute :name
  attribute :naics
  attribute :sic
  attribute :ein
  attribute :tier
end

class IncomeSerializer < BaseSerializer
  attribute :business_id
  attribute :period_sales
  attribute :cash_collections
  attribute :credit_sales
  attribute :entry_date
end

class CostOfSalesSerializer < BaseSerializer
  attribute :business_id
  attribute :cogs
  attribute :marketing
  attribute :direct_labor
  attribute :distribution
  attribute :vpie
end