require 'faker'

FactoryGirl.define do
  factory :category do |f|
    f.name  Faker::Lorem.characters(30)
  end
  
  factory :other_category, class: Category do |f|
    f.name  Faker::Lorem.characters(15)
  end
  
  factory :invalid_category, class: Category do |f|
    f.name  Faker::Lorem.characters(51)
  end
end
 
