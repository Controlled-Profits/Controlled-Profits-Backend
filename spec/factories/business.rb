FactoryGirl.define do
  factory :business do
    user
    name {Faker::Company.name}
    naics "0000"
    sic "0000"
    ein {Faker::Company.ein}
    tier 1
  end
end