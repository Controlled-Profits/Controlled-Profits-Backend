FactoryGirl.define do
  factory :user do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password "Password"
    password_confirmation "Password"
    tier 1
  end
end