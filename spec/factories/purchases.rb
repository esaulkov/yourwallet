require 'faker'

FactoryGirl.define do
  factory :purchase do |f|
    f.name        Faker::Lorem.characters(78)
    category
  end
end
 
