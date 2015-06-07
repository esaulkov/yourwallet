require 'faker'

FactoryGirl.define do
  factory :category do |f|
    f.name  Faker::Lorem.characters(30)
    user { FactoryGirl.create(:user) }
  end
  
  factory :other_category, class: Category do |f|
    f.name  Faker::Lorem.characters(15)
    user { FactoryGirl.create(:other_user) }
  end
  
  factory :invalid_category, class: Category do |f|
    f.name  Faker::Lorem.characters(51)
    user { FactoryGirl.create(:user) }
  end
end
 
