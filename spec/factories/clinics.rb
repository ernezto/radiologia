require 'faker'

FactoryGirl.define do
  factory :clinic do |f|
    f.name { Faker::Company.name }
    f.address { Faker::Address.street_address }
    f.phone { Faker::PhoneNumber.phone_number }
  end
end
