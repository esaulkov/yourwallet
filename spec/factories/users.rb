require "faker"

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password { Faker::Internet.password(8) }
    limit { Faker::Commerce.price }
    email { Faker::Internet.email }
  end

  factory :invalid_user, class: User do
    name { Faker::Name.name }
    password { Faker::Internet.password(8) }
    limit { -10.00 }
    email { Faker::Internet.email }
  end
end
