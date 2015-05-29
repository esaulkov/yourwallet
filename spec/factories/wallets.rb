require 'faker'

FactoryGirl.define do
  factory :wallet do |f|
    f.name        Faker::Lorem.characters(30)
    f.balance     Faker::Commerce.price
    user
  end
end
 
