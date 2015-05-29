require 'faker'

FactoryGirl.define do
  factory :transaction do |f|
    f.sum         Faker::Commerce.price
    f.date_time   Faker::Time.forward
    purchase
    wallet
  end
end
 
