require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :feature do
  let(:user) { create :user }

  before(:each) do
    user.save
  end

  after do
    User.destroy_all
  end

  scenario 'Public recipes' do
    sign_in user
    visit public_recipes_path

    expect(page).to have_current_path(public_recipes_path)
    expect(page).to have_content('Public Recipes')
  end
end
