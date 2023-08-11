require 'rails_helper'

RSpec.describe 'foods/new', type: :feature do
  let(:user) { create :user }
  before(:each) do
    user.save
  end

  after do
    Food.destroy_all
    User.destroy_all
  end

  scenario 'User creates a new food' do
    sign_in user

    # Visit the new food page
    visit new_food_path

    # Fill in the form fields
    fill_in 'food_name', with: 'Apple'
    fill_in 'food_measurement_unit', with: 'Piece'
    fill_in 'food_price', with: 1.99
    fill_in 'food_quantity', with: 10

    # Click the "Create Food" button
    click_button 'Create Food'

    expect(page).to have_current_path(foods_path)

    expect(page).to have_content('Food was successfully created.')

    expect(page).to have_content('Apple')
  end
end
