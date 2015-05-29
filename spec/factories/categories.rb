require 'faker'

FactoryGirl.define do
  factory :category do |f|
    f.name  Faker::Lorem.characters(30)
  end
end
 
