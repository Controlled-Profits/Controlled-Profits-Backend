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