require 'faker'

FactoryGirl.define do
  factory :doctor do
    dni { Faker::Number.number(11) }
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    mobile { Faker::PhoneNumber.phone_number }
    landline { Faker::PhoneNumber.phone_number }
    clinics { [create(:clinic), create(:clinic)] }
  end
end
