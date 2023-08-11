require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe_food) { FactoryBot.create(:recipe_food) }

  describe 'associations' do
    it 'should create a new recipe food' do
      expect(recipe_food.quantity).not_to be_nil
      expect(recipe_food.recipe_id).not_to be_nil
    end

    it 'should belong to a food' do
      expect(recipe_food.food_id).not_to be_nil
    end
  end
end
