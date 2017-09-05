class Business < ApplicationRecord
  belongs_to :user
  validates_format_of :ein, with: /\A([0-9]){2}(-)([0-9]){7}\z/, message: "EIN must be given in the format: XX-XXXXXXX", allow_blank: true
end
