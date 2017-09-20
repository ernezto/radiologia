require 'faker'

FactoryGirl.define do
  factory :clinic do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
  end
end
