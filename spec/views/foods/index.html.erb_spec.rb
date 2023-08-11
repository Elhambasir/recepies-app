require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
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
    visit foods_path

    expect(page).to have_current_path(foods_path)
    expect(page).to have_content('Name')

    # Click the New Food" button
    click_button 'New food'

    expect(page).to have_current_path(new_food_path)
    expect(page).to have_content('Back to foods')

    expect(page).to have_content('New food')
  end
end
