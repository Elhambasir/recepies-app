require 'rails_helper'

RSpec.describe 'foods/new', type: :feature do
  let(:user) { create :user }

  before do
    user.save
    sign_in user
    @recipe = FactoryBot.create(:recipe, user:, name: 'Pizza', description: 'This is a pizza recipe', public: false)
    @food = FactoryBot.create(:food, user:, name: 'Flour')
    @recipe.save
    @food.save
    @recipe_food = FactoryBot.create(:recipe_food, food: @food, recipe: @recipe, quantity: 20)
    @recipe_food.save
  end

  after do
    RecipeFood.destroy_all
    Recipe.destroy_all
    Food.destroy_all
    User.destroy_all
  end

  scenario 'Shows a shopping list' do
    visit general_shopping_lists_path

    expect(page).to have_current_path(general_shopping_lists_path)
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Flour')
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
    expect(page).to have_content('5')
    expect(page).to have_content('10')
  end
end
