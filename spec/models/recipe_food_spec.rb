require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.create(name: 'Elham')
    @food = Food.create(name: 'rice', measurement_unit: 'g', price: 15.5, quantity: 10, user_id: 1)
    @recipe = Recipe.create(name: 'rice', preparation_time: 5, cooking_time: 7, description: 'description',
                            public: true, user_id: 1)
    @recipe_food = RecipeFood.create(quantity: '5', food_id: 2, recipe_id: 1)
  end

  before { subject.save }

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should not be empty' do
    subject.quantity = ' '
    expect(subject).to_not be_valid
  end

  it 'quantity should have valid value' do
    expect(subject.quantity).to eql 5
  end

  it 'quantity should be a integer' do
    expect(subject.quantity).to be_a(Integer)
  end
end
