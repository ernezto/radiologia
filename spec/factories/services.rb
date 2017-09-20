require 'faker'

FactoryGirl.define do
  factory :service do
    name  { Faker::Commerce.product_name }
    tip   { Faker::Number.positive }
    price { Faker::Commerce.price }
  end
end
