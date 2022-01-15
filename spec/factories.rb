FactoryBot.define do
  factory :user do
    password { "password" }
    password_confirmation { "password" }

    sequence(:email) { |n| "email#{n}@factory.com" }
  end


  factory :post do
    title { "Test" }
    body { "12345" }
    user { User.first }
    views { 0 }
  end
end
