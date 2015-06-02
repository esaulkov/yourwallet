require 'faker'

FactoryGirl.define do
  factory :wallet do
    name        Faker::Lorem.characters(30)
    balance     Faker::Commerce.price
    user {FactoryGirl.create(:user)}
  end
  
  factory :other_wallet, class: Wallet do
    name        Faker::Lorem.characters(10)
    balance     Faker::Commerce.price
    user {FactoryGirl.create(:other_user)}
  end

  factory :invalid_wallet, class: Wallet do
    name        Faker::Lorem.characters(51)
    balance     Faker::Commerce.price
    user {FactoryGirl.create(:user)}
  end
end
 
