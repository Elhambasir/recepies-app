FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1234567' }
  end
  

  factory :food do
    name { Faker::Food.dish }
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 100) }
    user
  end

  factory :recipe do
    name { 'Ugali' }
    preparation_time { 0.5 }
    cooking_time { 0.5 }
    description { 'This is a recipe' }
    user

    # Creating a list of associated recipe_foods (and thus foods) for the recipe
    transient do
      foods_count { 3 } # Number of associated foods to create
    end

    after(:create) do |recipe, evaluator|
      create_list(:recipe_food, evaluator.foods_count, recipe: recipe)
    end
  end

  factory :recipe_food do
    recipe
    food
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end
