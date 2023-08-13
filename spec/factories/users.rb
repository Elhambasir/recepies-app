FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1234567' }
    confirmed_at { Date.today }
  end
end
