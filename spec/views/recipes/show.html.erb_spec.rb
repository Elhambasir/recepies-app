require 'rails_helper'

RSpec.describe 'recipe/show', type: :feature do
  let(:user) { create :user }

  before(:each) do
    user.save
    sign_in user

    @recipe = FactoryBot.create(:recipe, user:, name: 'Pizza', description: 'This is a pizza recipe',
                                         public: false)
  end

  scenario 'Shows recipe details' do
    @recipe.save

    visit recipes_path
    click_link 'Show this recipe'

    expect(page).to have_content('This is a pizza recipe')
    expect(page).to have_content('Pizza')
    expect(page).to have_content('Back to recipes')
    expect(page).to have_content('Destroy this recipe')
    expect(page).to have_content('Edit this recipe')
    expect(page).to have_content('Make Public')
    expect(page).to have_content('Public: No')

    click_button 'Make Public'

    expect(page).to have_content('Make Private')
    expect(page).to have_content('Public: Yes')
    expect(page).to have_content('Add ingridient')
    expect(page).to have_content('Generate Shopping list')

    click_button 'Add ingridient'
    expect(page).to have_content('New recipe food')

    click_link 'Back to recipe'

    click_button 'Generate Shopping list'
    expect(page).to have_current_path(general_shopping_list_path)
  end
end
