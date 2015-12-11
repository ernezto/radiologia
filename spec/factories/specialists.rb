require 'faker'

FactoryGirl.define do
  factory :specialist do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
  end

end
