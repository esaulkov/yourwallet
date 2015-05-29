require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name        Faker::Name.name
    f.password    Faker::Internet.password
    f.limit       Faker::Commerce.price
    f.email       Faker::Internet.email
  end
end
 
