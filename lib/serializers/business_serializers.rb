require 'jsonapi-serializers'

class BaseSerializer 
  include JSONAPI::Serializer
end

class UserSerializer < BaseSerializer
  attribute :firstname
  attribute :lastname
  attribute :email
  attribute :tier
end

class BusinessSerializer < BaseSerializer
  attribute :user_id
  attribute :name
  attribute :naics
  attribute :sic
  attribute :ein
  attribute :tier
end