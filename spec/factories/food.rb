FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 100) }
    user
  end
end
