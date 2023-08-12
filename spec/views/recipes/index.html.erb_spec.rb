require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  let(:user) { create :user }

  before(:each) do
    user.save
    # @recipe = FactoryBot.creaate(:recipe, user:)
  end

  after do
    Recipe.destroy_all
    User.destroy_all
  end

  scenario 'Create recipe' do
    sign_in user
    visit recipes_path

    expect(page).to have_current_path(recipes_path)
    expect(page).to have_content('New recipe')

    click_link 'New recipe'
    expect(page).to have_current_path(new_recipe_path)
    expect(page).to have_content('New recipe')
    expect(page).to have_content('Name')
    expect(page).to have_content('Preparation time')

    fill_in 'recipe_name', with: 'Pizza'
    fill_in 'recipe_preparation_time', with: 2
    fill_in 'recipe_cooking_time', with: 2.0
    fill_in 'recipe_description', with: 'This is a recipe description'

    click_button 'Create Recipe'

    expect(page).to have_content('Pizza')
    expect(page).to have_content('Back to recipes')
    expect(page).to have_content('Destroy this recipe')
  end
end
