require 'faker'

FactoryGirl.define do
  factory :transaction do
    sum         Faker::Commerce.price
    date_time   Faker::Time.forward(3)
    wallet {FactoryGirl.create(:wallet)}
    purchase {FactoryGirl.create(:purchase)}
  end

  factory :other_transaction, class: Transaction do
    sum         Faker::Commerce.price
    date_time   Faker::Time.forward(5)
    wallet {FactoryGirl.create(:other_wallet)}
    purchase {FactoryGirl.create(:other_purchase)}
  end

  factory :invalid_transaction, class: Transaction do
    sum         0.00
    date_time   Faker::Time.forward
    wallet {FactoryGirl.create(:wallet)}
    purchase {FactoryGirl.create(:purchase)}
  end
end
 
