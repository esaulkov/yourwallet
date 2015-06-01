require 'faker'

FactoryGirl.define do
  factory :purchase do
    name        Faker::Lorem.characters(72)
    category {FactoryGirl.create(:category)}
  end

  factory :other_purchase, class: Purchase do
    name        Faker::Lorem.characters(32)
    category {FactoryGirl.create(:other_category)}
  end

  factory :invalid_purchase, class: Purchase do
    name        Faker::Lorem.characters(101)
    category {FactoryGirl.create(:category)}
  end
end
 
