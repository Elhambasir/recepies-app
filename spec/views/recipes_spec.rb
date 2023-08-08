RSpec.describe 'Recipes page', type: :feature do
  it 'shows the login page' do
    visit root_path
    expect(page).to have_content('Log in')
  end
end
